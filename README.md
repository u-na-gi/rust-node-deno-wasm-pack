# rust-node-deno-wasm-pack

Rust (wasm-pack / cargo-watch / cargo-generate) + Node.js + Deno 入りの開発用イメージ。

## 中身

| ツール | バージョン |
| --- | --- |
| ベース | `node:24.20.0-trixie` (Debian 13) |
| Deno | 2.9.6 |
| Rust | rustup 経由の stable (+ `wasm32-unknown-unknown`) |
| wasm-pack / cargo-binstall / cargo-watch / cargo-generate | cargo install 時点の最新 |

## 使う

```shell
docker pull ghcr.io/u-na-gi/rust-node-deno-wasm-pack:latest
docker run -it --rm ghcr.io/u-na-gi/rust-node-deno-wasm-pack:latest bash
```

## ローカルで焼く

```shell
make build   # rust-node-deno-wasm-pack:latest
make run     # bash で入る
```
