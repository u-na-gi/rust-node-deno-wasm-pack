build:
	docker build --platform linux/amd64 . -t rust-node-deno-wasm-pack:latest

run:
	docker run -it --rm rust-node-deno-wasm-pack:latest bash