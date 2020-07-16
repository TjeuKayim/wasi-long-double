fn main() {
    cc::Build::new()
        .file("src/foo.c")
        .include("src")
        .compile("foo");
}
