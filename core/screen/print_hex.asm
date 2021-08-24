print_hex:
  pusha
  mov bp, sp

  mov ah, 0x0e

  mov al, '0'
  int 10

  mov al, 'x'
  int 10

  mov dl, 4

.loop:
  int 0x10

  mov sp, bp
  popa
  ret
