FROM alpine/curl as builder

ARG PBANDK_VERSION=0.14.1
ENV GOOS=linux GOARCH=amd64 CGO_ENABLED=0

RUN curl -f --output /usr/local/bin/protoc-gen-pbandk https://repo1.maven.org/maven2/pro/streem/pbandk/protoc-gen-pbandk-jvm/$PBANDK_VERSION/protoc-gen-pbandk-jvm-$PBANDK_VERSION-jvm8.jar && chmod +x /usr/local/bin/protoc-gen-pbandk

FROM scratch

COPY --from=builder /usr/local/bin/protoc-gen-pbandk /protoc-gen-pbandk

ENTRYPOINT ["/protoc-gen-pbandk"]