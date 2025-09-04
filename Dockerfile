# Dockerfile for Rust TCP Server
FROM rust:1.75 as builder

WORKDIR /app

# Copy source files
COPY server.rs .
COPY tcp.rs .

# Create a minimal Cargo.toml for the server
RUN echo '[package]' > Cargo.toml && \
    echo 'name = "copilot-server"' >> Cargo.toml && \
    echo 'version = "0.1.0"' >> Cargo.toml && \
    echo 'edition = "2021"' >> Cargo.toml && \
    echo '' >> Cargo.toml && \
    echo '[[bin]]' >> Cargo.toml && \
    echo 'name = "server"' >> Cargo.toml && \
    echo 'path = "server.rs"' >> Cargo.toml

# Build the application
RUN cargo build --release

# Runtime stage
FROM debian:bookworm-slim

# Install runtime dependencies
RUN apt-get update && apt-get install -y \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Copy the binary from builder stage
COPY --from=builder /app/target/release/server /usr/local/bin/server

# Expose the port
EXPOSE 8000

# Run the server
CMD ["server"]