FROM alpine:latest

LABEL org.opencontainers.image.source https://github.com/pyk/fly-proxy

COPY --from=flyio/flyctl:v0.0.475 /flyctl /usr/local/bin/

RUN apk --no-cache add socat
COPY start-proxy.sh /usr/local/bin/start-proxy.sh
RUN chmod u+x /usr/local/bin/start-proxy.sh

ENTRYPOINT [ "start-proxy.sh" ]