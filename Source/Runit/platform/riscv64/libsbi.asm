.section .text

// Legacy EID's

.equ SBI_SET_TIMER_EID, 0x00
.equ SBI_CONSOLE_PUTCHAR_EID, 0x01
.equ SBI_CONSOLE_GETCHAR_EID, 0x02
.equ SBI_CLEAR_IPI_EID, 0x03
.equ SBI_SEND_IPI_EID, 0x04
.equ SBI_REMOTE_FENCE_I_EID, 0x05
.equ SBI_REMOTE_SFENCE_VMA_EID, 0x06
.equ SBI_REMOTE_SFENCE_VMA_ASID_EID, 0x07
.equ SBI_SHUTDOWN_EID, 0x08

// Legacy extensions

.global sbi_set_timer
sbi_set_timer:
  li a7, SBI_SET_TIMER_EID
  ecall
  ret

.global sbi_console_putchar
sbi_console_putchar:
  li a7, SBI_CONSOLE_PUTCHAR_EID
  ecall
  ret

.global sbi_console_getchar
sbi_console_getchar:
  li a7, SBI_CONSOLE_GETCHAR_EID
  ecall
  ret

.global sbi_clear_ipi
sbi_clear_ipi:
  li a7, SBI_CLEAR_IPI_EID
  ecall
  ret

.global sbi_send_ipi
sbi_send_ipi:
  li a7, SBI_SEND_IPI_EID
  ecall
  ret

.global sbi_remote_fence_i
sbi_remote_fence_i:
  li a7, SBI_REMOTE_FENCE_I_EID
  ecall
  ret

.global sbi_remote_sfence_vma
sbi_remote_sfence_vma:
  li a7, SBI_REMOTE_SFENCE_VMA_EID
  ecall
  ret

.global sbi_remote_sfence_vma_asid
sbi_remote_sfence_vma_asid:
  li a7, SBI_REMOTE_SFENCE_VMA_ASID_EID
  ecall
  ret

.global sbi_shutdown
sbi_shutdown:
  li a7, SBI_SHUTDOWN_EID
  ecall
  ret
