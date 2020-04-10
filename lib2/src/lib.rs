#[no_mangle]
pub extern "C" fn foo2() -> Box<i32> {
    Box::new(5)
}
