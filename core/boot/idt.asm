%macro isr_x 1
  dw %1
  dw CODE_SEG
  db 0
  db 10101110b
  dw 0
%endmacro


idt_start:
  ;times 256 dw unhandled_isr, 8, 0x8E00, 0
isr_0: isr_x 0
; isr_1: isr_x 1
; isr_2: isr_x 2
; isr_3: isr_x 3
; isr_4: isr_x 4
; isr_5: isr_x 5
; isr_6: isr_x 6
; isr_7: isr_x 7
; isr_8: isr_x 8
; isr_9: isr_x 9
; isr_10: isr_x 10
; isr_11: isr_x 11
; isr_12: isr_x 12
; isr_13: isr_x 13
; isr_14: isr_x 14
; isr_15: isr_x 15
; isr_16: isr_x 16
; isr_17: isr_x 17
; isr_18: isr_x 18
; isr_19: isr_x 19
; isr_20: isr_x 20
; isr_21: isr_x 21

; isr_22: isr_x 22
; isr_23: isr_x 23
; isr_24: isr_x 24
; isr_25: isr_x 25
; isr_26: isr_x 26
; isr_27: isr_x 27
; isr_28: isr_x 28
; isr_29: isr_x 29
; isr_30: isr_x 30
; isr_31: isr_x 31

; isr_32: isr_x 32
; isr_33: isr_x 33
; isr_34: isr_x 34
; isr_35: isr_x 35
; isr_36: isr_x 36
; isr_37: isr_x 37

idt_end:
idt_descriptor:
  dw idt_end - idt_start - 1
  dd idt_start
