fn main() {
    unsafe { print_long_double() };
}

extern "C" {
    fn print_long_double();
}
