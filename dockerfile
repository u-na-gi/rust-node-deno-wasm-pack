FROM node:24.20.0-trixie
COPY --from=denoland/deno:debian-2.9.6 /usr/bin/deno /usr/bin/deno

RUN apt-get update && apt-get install -y --no-install-recommends curl wget git clang llvm \
    && rm -rf /var/lib/apt/lists/*

# rustは環境構築簡単だが、nodejsは色々buildしないといけなくてだるい。
# rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o installer.sh \
    && sh installer.sh -y \
    && rm installer.sh

# rustのパスを通す
ENV PATH="/root/.cargo/bin:${PATH}"

RUN rustup target add wasm32-unknown-unknown

RUN cargo install wasm-pack

# 重いから入れとこ
RUN cargo install cargo-binstall
RUN cargo binstall --force --no-confirm cargo-watch cargo-generate


# deno
ENV PATH="/root/.deno/bin:${PATH}"
