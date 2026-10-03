.PHONY: build test lint clean check run

build:
	cargo build --manifest-path src-tauri/Cargo.toml --release

check:
	cargo check --manifest-path src-tauri/Cargo.toml

test:
	cargo test --locked --manifest-path src-tauri/Cargo.toml --lib

lint:
	cargo clippy --manifest-path src-tauri/Cargo.toml -- -D warnings

run:
	cargo run --manifest-path src-tauri/Cargo.toml

clean:
	cargo clean --manifest-path src-tauri/Cargo.toml
