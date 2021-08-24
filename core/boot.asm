[ORG 0x7C00]
[BITS 16]

global run_code
SEGMENT .text


run_code:
  mov ax, 0x1000
  mov sp, ax
  mov bp, ax

  call clear_scr

  mov si, msg_boot_started
  call print_line

  ;call drive_loopup
  call disk_load

  cmp ax, 0
  je disk_loaded

  cmp ax, 1
  je .disk_reset_error

  cmp ax, 2
  je .disk_read_error

  cmp ax, 3
  je .disk_sector_error

  jmp $

.disk_reset_error:
  mov si, msg_disc_reset_error
  call print_line

  jmp .fatality

.disk_read_error:
  mov si, msg_disc_read_error
  call print_line

  jmp .fatality

.disk_sector_error:
  mov si, msg_disc_sector_error
  call print_line

  jmp .fatality

.fatality:
  mov si, msg_fatality
  call print_line

  jmp $

disk_loaded:
  mov si, msg_disc_read_ok
  call print_line

  jmp $

%include './screen/clear.asm'
%include './screen/print_line.asm'
%include './drive/load.asm'

msg_boot_started:          db 'OS Booting started', 0
msg_fatality:              db 'Error while boot. Exiting...', 0
msg_disc_reset_error:      db 'DiskER: reset',0
msg_disc_read_error:       db 'DiskER: read', 0
msg_disc_sector_error:     db 'DiskER: sector', 0
msg_disc_read_ok:          db 'DISK READ OK', 0

  times 510 -( $ - $$ ) db 0
  dw 0xaa55

%include './kernel.asm'

  times 1020 - ($ - $$) db 1
  dw 0x9999

  times 1534 - ($ - $$) db 2
  dw 0x9999
