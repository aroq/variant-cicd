FROM golang:1-alpine as builder
RUN apk add --update \
    git
RUN pwd && \
  git clone https://github.com/aroq/variant.git && \
  cd variant && \
  git checkout master && \
  go build && \
  cp variant /usr/bin/

FROM michaeltigr/zebra-standalone
COPY --from=builder /usr/bin/variant /usr/local/bin/variant
