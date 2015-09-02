#!/bin/bash

i686-elf-as src/start.S -o start.o
cargo build --target=i686-unknown-linux-gnu.json --verbose
i686-elf-ld -T src/link.ld -o myos.bin start.o target/i686-unknown-linux-gnu/debug/libcykusz_rust.a --gc-sections
qemu-system-i386 -kernel myos.bin
