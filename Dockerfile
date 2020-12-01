FROM golang:alpine AS builder

WORKDIR $GOPATH/src/mylekkepackage/mylekkeapp/
ADD app.go .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /go/app

FROM scratch

COPY --from=builder /go/app /go/app

CMD ["/go/app"]
