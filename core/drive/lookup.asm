disk_lookup:
  pusha

.find_disk
  mov dx, 0
  mov al, 0
  mov ah, 0x15
  int 0x13

  cmp ah, 0
  je .next_disk

  cmp ah, 0x03
  je .found_disk

  jmp .found_diskette

.next_disk:
  cmp dx, 0xff
  je .done
  jmp .find_disk

.found_disk:
  jmp .next_disk

.found_diskette:
  jmp .next_disk

.done:
  popa
  ret
