load_gdt:
  ; toggle off interrupts
  cli

  ; load GDT register
  lgdt [gdt_descriptor]

  ; activate GDT
  mov eax, cr0
  or eax, 00000001b
  mov cr0, eax

  ; far jump sets code segment into register cs
  ;jmp 0x08:init_private_mode
  jmp CODE_SEG:init_private_mode


; GDT
gdt_start:

  ;the mandatory null descriptor
gdt_null:
  ; ’dd ’ means define double word ( i.e. 4 bytes )
  dd 0x0
  dd 0x0

gdt_code:
  dw 0xffff
  dw 0
  db 0
  db 10011010b
  db 11001111b
  db 0

gdt_data:
  dw 0xffff
  dw 0
  db 0
  db 10010010b
  db 11001111b
  db 0

gdt_end:
  ; The reason for putting a label at the end of the
  ; GDT is so we can have the assembler calculate
  ; the size of the GDT for the GDT decriptor ( below )
  ; GDT descriptior
gdt_descriptor:
  ; Size of our GDT , always less one of the true size
  ; dw gdt_end - gdt_start - 1
  dw gdt_end - gdt_start - 1

  ; Start address of our GDT
  dd gdt_start

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
