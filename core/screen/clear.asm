clear_scr:
  push ax

  mov ah, 0x0
  mov al, 0x03
  int 0x10

  pop ax
  ret
