# syntax=docker/dockerfile:1

ARG BUILDPLATFORM
ARG TARGETOS
ARG TARGETARCH

# 前端构建与架构无关（输出 dist），强制在 BUILDPLATFORM 构建，避免 arm64 走 QEMU 跑 node/npm
FROM --platform=$BUILDPLATFORM node:20-alpine AS web-builder

ARG VERSION=1.0.0
WORKDIR /build/web

# 先拷贝依赖清单，充分利用缓存
COPY ./web/package.json ./web/package-lock.json ./
RUN npm ci --no-audit --no-fund

# 再拷贝源码
COPY ./web ./
RUN VITE_VERSION=${VERSION} npm run build


# Go 编译在 BUILDPLATFORM 执行，通过 TARGETOS/TARGETARCH 交叉编译出目标二进制，避免 QEMU
FROM --platform=$BUILDPLATFORM golang:alpine AS builder2

ARG TARGETOS
ARG TARGETARCH
ARG VERSION=1.0.0
ENV GO111MODULE=on \
    CGO_ENABLED=0

WORKDIR /build

ADD go.mod go.sum ./
RUN go mod download

COPY . .
COPY --from=web-builder /build/web/dist ./web/dist
RUN CGO_ENABLED=0 GOOS=${TARGETOS:-linux} GOARCH=${TARGETARCH:-amd64} \
    go build -ldflags "-s -w -X gpt-load/internal/version.Version=${VERSION}" -o gpt-load


FROM alpine

WORKDIR /app
RUN apk upgrade --no-cache \
    && apk add --no-cache ca-certificates tzdata \
    && update-ca-certificates

COPY --from=builder2 /build/gpt-load .
EXPOSE 3001
ENTRYPOINT ["/app/gpt-load"]
