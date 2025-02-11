build:
	docker build . -t rust-node-deno-wasm-pack:latest

run:
	docker run -it --rm rust-node-deno-wasm-pack:latest bash