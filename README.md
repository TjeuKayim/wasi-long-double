# WASI long double bug

A Rust crate with C dependency that uses `long double`
targeting wasm32-wasi links incorrectly
(`double` works just fine).

Steps to reproduce:

1. Build the Dockerfile
1. Run a bash shell in the container
1. Execute these commands:

```sh
export CC_wasm32_wasi=/opt/wasi-sdk/bin/clang
export CARGO_TARGET_WASM32_WASI_LINKER=/opt/wasi-sdk/bin/clang
export RUSTFLAGS='-C target-feature=-crt-static -C link-arg=-lc-printscan-long-double'
cargo build --target wasm32-wasi

# print_double succeeds
wasmtime target/wasm32-wasi/debug/double.wasm
x = 2049033599.000000

# print_long_double fails
wasmtime target/wasm32-wasi/debug/long-double.wasm
Error: failed to run main module `target/wasm32-wasi/debug/long-double.wasm`

Caused by:
    0: failed to instantiate "target/wasm32-wasi/debug/long-double.wasm"
    1: unknown import: `env::__floatsitf` has not been defined

# clang links print_long_double correctly
/opt/wasi-sdk/bin/clang src/foo.c -Wl,--no-threads -nostartfiles -Wl,--no-entry -Wl,--export-all -lc-printscan-long-double -o target/foo.wasm
wasmtime target/foo.wasm --invoke print_long_double
x = 2049033599.000000
```
