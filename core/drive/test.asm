msg_test_routine_ok: db 'routine ok', 0

testroutine:
  mov al, '8'
  call print_char

  mov si, msg_test_routine_ok
  call print_line

  mov ax, 0
  ret
