# Introduction

This is the dockerfile for the pbandk plugin. See [source repository](https://github.com/streem/pbandk).

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
docker build . -t plugins.buf.build/julienfouilhe/pbandk:v0.14.1 && \
docker push plugins.buf.build/julienfouilhe/pbandk:v0.14.1
```