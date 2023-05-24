extern "C" {
    fn print_num(num: i32);
}

fn main() {
    println!("[rust] start");
    unsafe { print_num(50) }
    println!("[c] called");
}
