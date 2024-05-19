# Build stage
FROM rust:latest as builder
WORKDIR /app
ADD . /app
RUN cargo build --release

# Prod stage
FROM gcr.io/distroless/cc:latest
COPY --from=builder /app/target/release/may /

EXPOSE 80

# Run the binary
CMD ["./may"]
