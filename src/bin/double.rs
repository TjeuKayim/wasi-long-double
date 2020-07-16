fn main() {
    unsafe { print_double() };
}

extern "C" {
    fn print_double();
}
