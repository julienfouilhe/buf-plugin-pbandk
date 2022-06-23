FROM alpine/curl as builder

ARG PBANDK_VERSION=0.14.1

RUN curl -f --output /usr/local/bin/protoc-gen-pbandk https://repo1.maven.org/maven2/pro/streem/pbandk/protoc-gen-pbandk-jvm/$PBANDK_VERSION/protoc-gen-pbandk-jvm-$PBANDK_VERSION-jvm8.jar
RUN ls /usr/local/bin/protoc-gen-pbandk

FROM amazoncorretto:18
USER 1000
WORKDIR /home/pbandk

COPY --from=builder --chmod=0777 /usr/local/bin/protoc-gen-pbandk /home/pbandk/protoc-gen-pbandk

ENTRYPOINT ["/home/pbandk/protoc-gen-pbandk"]