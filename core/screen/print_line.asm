print_line:
  pusha
  mov ah, 0x0e                  ; write screen mode

.print_string:
  lodsb
  cmp al, 0
  je .done

  int 0x10
  jmp .print_string

.done:
  mov ah, 0x03                  ; get cursor position int
  mov bh, 0x00                  ; page number
  int 0x10

  mov ah, 0x02                  ; set cursor position int
  mov bh, 0x00                  ; set page number
  inc dh                        ; set row
  mov dl, 0                     ; set column
  int 0x10

  inc dh

  popa
  ret
