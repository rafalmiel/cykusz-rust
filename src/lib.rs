#![feature(no_std)]
#![feature(lang_items)]
#![no_std]

extern crate rlibc;

// Kernel entrypoint
#[lang="start"]
#[no_mangle]
pub fn kmain()
{
    // Paint screen yellow and exit
    unsafe {
        for i in 0 .. (80 * 25) {
            *((0xb8000 + i * 2) as *mut u16) = ((i % 16) as u16) << 12;
         }
    }
    loop {}
}

#[lang = "stack_exhausted"] extern fn stack_exhausted() {}
#[lang = "eh_personality"] extern fn eh_personality() {}
#[lang = "panic_fmt"] fn panic_fmt() -> ! { loop {} }