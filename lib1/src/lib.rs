#[no_mangle]
pub extern "C" fn foo1() -> Box<i32> {
    Box::new(5)
}
