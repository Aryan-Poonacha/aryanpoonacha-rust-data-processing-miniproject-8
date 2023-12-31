install:
	rustup update &&\
		cargo build --release

test:
	cargo test

format:	
	cargo fmt

lint:
	cargo clippy

container-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

refactor: format lint

run:
	cargo run --bin extract &&\
	cargo run --bin transform_load &&\
	cargo run --bin query

deploy:
	cargo run --bin extract &&\
	cargo run --bin transform_load &&\
	cargo run --bin query
		
all: install lint test format refactor deploy