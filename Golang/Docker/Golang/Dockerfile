FROM golang:1.13-alpine

COPY scripts /

RUN apk add --no-cache ca-certificates \
		dpkg \
		gcc \
		git \
		musl-dev \
		bash

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" \
		&& chmod -R 777 "$GOPATH" \
		&& chmod +x /entrypoint.sh \
		&& chmod +x /realize.sh

# RUN go get github.com/oxequa/realize
RUN sh /realize.sh

WORKDIR $GOPATH
ENTRYPOINT ["/entrypoint.sh"]

CMD ["realize", "start"]
