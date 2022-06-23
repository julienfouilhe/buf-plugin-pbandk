# Introduction

This is the dockerfile for the pbandk plugin. See [source repository](https://github.com/streem/pbandk).

# Limitations

- protoc-gen-pbandk cannot be run as root. This is why this Dockerfile creates a custom user, which can potentially lead to issues
- It depends on java, which is a big dependency to add. I couldn't figure out how to use an alpine image version.

# Usage

`buf.gen` file example:

```yaml
version: v1
plugins:
  - remote: buf.build/julienfouilhe/plugins/pbandk
    out: gen/proto/kotlin
```

# Publish new version

See https://docs.buf.build/bsr/remote-generation/plugin-example

```bash
DOCKER_BUILDKIT=1 docker build . -t plugins.buf.build/julienfouilhe/pbandk:v0.14.1 && \
docker push plugins.buf.build/julienfouilhe/pbandk:v0.14.1
```