#FROM gcr.io/distroless/busybox # doesnt exist, need to create custom bazel build in SSE
FROM busybox
ENV HUGO_VERSION=0.36.1
RUN wget -O- https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz | tar zx

FROM gcr.io/distroless/base
COPY --from=0 /hugo /
WORKDIR /bin
COPY --from=0 /bin/sh .

ENTRYPOINT ["/bin/sh"]
