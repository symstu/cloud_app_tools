welcome32: db 'Protected mode activated', 0

kernel:
  mov ebx, welcome32
  call print_string_pm

  hlt

%include './print32.asm'
