FROM --platform=amd64 node:22.8.0-bullseye
COPY --from=denoland/deno:debian-1.46.3 /usr/bin/deno /usr/bin/deno

RUN apt update && apt install -y curl wget git clang llvm

# rustは環境構築簡単だが、nodejsは色々buildしないといけなくてだるい。
# rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o installer.sh
RUN sh installer.sh -y

# rustのパスを通す
ENV PATH="/root/.cargo/bin:${PATH}"

RUN rustup target add wasm32-unknown-unknown

RUN cargo install wasm-pack

# 重いから入れとこ
RUN cargo install cargo-binstall
RUN cargo binstall --force --no-confirm cargo-watch cargo-generate


# deno
ENV PATH "/root/.deno/bin:$PATH"