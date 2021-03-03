FROM golang:1.15.8

WORKDIR /build
ADD . /build/

RUN CGO_ENABLED=0 GOOS=linux go build -mod=vendor -o api-server .

FROM scratch

WORKDIR /app
COPY --from=builder /build/api-server /app/api-server

CMD [ "/app/api-server" ]
