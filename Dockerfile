FROM rust:1.44.1

RUN curl -sS -L -O https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-11/wasi-sdk_11.0_amd64.deb && \
    dpkg -i wasi-sdk_11.0_amd64.deb && \
    rm -f wasi-sdk_11.0_amd64.deb && \
    rustup target add wasm32-wasi && \
    curl https://wasmtime.dev/install.sh -sSf | bash
