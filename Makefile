all:
	if [ ! -d "out" ]; then mkdir out; fi
	nasm -f bin -g core/boot.asm -o out/boot.bin
  nasm -f bin -g core/kernel.asm -o out/kernel.bin
	rm /tmp/qemu-debug-log

run:
	qemu-system-x86_64 -d cpu_reset -D /tmp/qemu-debug-log \
		-drive format=raw,file=out/boot.bin \
    # -monitor stdio

debug:
	qemu-system-x86_64 -S -s out/boot.bin

clean:
	rm -rf out
