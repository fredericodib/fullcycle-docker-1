FROM golang:1.16 AS builder
WORKDIR /app/
COPY ./hello-world.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags="-s -w" -installsuffix cgo -o app hello-world.go

FROM scratch 
WORKDIR /app/
COPY --from=builder /app/app ./
CMD ["./app"]  