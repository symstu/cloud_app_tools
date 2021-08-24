[bits 32]
section .text
init_private_mode:
  mov ax, DATA_SEG
  mov ds, ax
  mov ss, ax
  mov es, ax
  mov fs, ax
  mov gs, ax

  ;mov ebp, 0x90000
  ;mov esp, ebp

  ;lidt [idt_descriptor]
  ;sti                           ; error here
  ;call 0x1000
  hlt

isr0:
  pusha
  popa
  ;mov ebx, isr0_string
  ;call print_string_pm
  iret

isr0_string: db 'isr0 fired', 0
