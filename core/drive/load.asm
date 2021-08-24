disk_load:
  pusha

.reset:
  mov ah, 0
  mov dl, 0x80

  int 0x13
  jc .reset_error

.read:
  mov ebx, 0x9000

  mov ah, 0x02
  mov al, 0x01
  push ax

  mov ch, 0
  mov cl, 2
  mov dh, 0
  int 0x13

  jc .read_error
  pop bx

  ; here is error, need to compare al, al
  cmp al, bl
  jne .sector_error

.done:
  popa
  mov ax, 0
  ret

.reset_error:
  popa
  mov ax, 1
  ret

.read_error:
  popa
  mov ax, 2
  ret

.sector_error:
  popa
  mov ax, 3
  ret
