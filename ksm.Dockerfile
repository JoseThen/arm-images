FROM golang:1.13-alpine AS builder
ARG VERSION

RUN apk add make git

WORKDIR /opt
RUN git clone https://github.com/kubernetes/kube-state-metrics.git . \
  && git fetch --tags \
  && git checkout $VERSION \
  && make build-local

# -----------------------------------------
FROM gcr.io/distroless/static

COPY --from=builder /opt/kube-state-metrics /
USER nobody
ENTRYPOINT ["/kube-state-metrics", "--port=8080", "--telemetry-port=8081"]

EXPOSE 8080 8081