.section .text

// a0 is register to read
//

.global csr_read
  mv t3, a0
  ret
