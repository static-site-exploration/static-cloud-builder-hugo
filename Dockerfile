# TODO:(markdorrill) FROM gcr.io/static-distroless/busybox 
#   Create by cloning GCP distroless busybox bazel build 

FROM busybox

ENV HUGO_VERSION=0.36.1
RUN wget -O- https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz | tar zx

# TODO:(markdorrill) FROM gcr.io/static-distroless/sh 
#   Create by cloning GCP distroless busybox bazel build and reducing commands to just sh 

FROM gcr.io/distroless/base

RUN mkdir /package # where the source goes
RUN mkdir /build # where the build is put

WORKDIR /bin
COPY --from=0 /hugo .
COPY --from=0 /bin/sh .

ENTRYPOINT ["hugo"]
