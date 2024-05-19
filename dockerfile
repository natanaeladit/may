# Build stage
FROM rust:1.78 as builder
WORKDIR /app
ADD . /app
RUN cargo build --release

# Prod stage
FROM gcr.io/distroless/cc
COPY --from=builder /app/target/release/may /

EXPOSE 80

# Run the binary
CMD ["./may"]
