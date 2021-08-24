debug: build-debug
		qemu-system-x86_64 \
		-d cpu_reset,pcall,mmu\
		-D /tmp/qemu-debug-log \
		-drive file=out/boot.bin,format=raw,index=0,if=ide,media=disk \
		#-s -S

run-debug: build-debug
	# qemu-system-x86_64 \
	# 	-d cpu_reset \
	# 	-D /tmp/qemu-debug-log \
	# 	-drive file=out/debug-boot.elf,format=raw,index=0,if=ide,media=disk
	qemu-system-x86_64 \
		-d cpu_reset \
		-D /tmp/qemu-debug-log \
	 	-drive file=out/debug-boot.elf,format=raw,index=0,if=ide,media=disk


build:
	if [ ! -d "out" ]; then mkdir out; fi
	nasm kernel.asm -f bin -g -o out/kernel.bin
	nasm boot.asm -f elf -g -o out/boot.bin

build-debug:
	if [ ! -d "out" ]; then mkdir out; fi
	# nasm boot.asm -f elf64 -F dwarf -g -o out/boot.o
	nasm boot.asm -f bin -g -o out/boot.bin

	# on MacOS need to be install binutils with
	# brew install elf-binutils
	# /usr/local/Cellar/x86_64-elf-binutils/2.36.1/bin/x86_64-elf-ld \
	# 	-T boot.ld -elf_x86_64 out/boot.o -o out/debug-boot.elf

run: build
	qemu-system-x86_64 \
		-d cpu_reset \
		-D /tmp/qemu-debug-log \
		-drive file=out/boot.bin,format=raw,index=0,if=ide,media=disk \
		-monitor stdio
		# -drive file=./kernel.bin,format=raw,index=1,if=ide,media=cdrom

clean:
	rm -rf *.bin
	rf -rf out/*
