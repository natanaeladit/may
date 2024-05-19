FROM rust:1.78

COPY ./ ./

RUN cargo build --release

EXPOSE 80

# Run the binary
CMD ["./target/release/may"]
