# 1 "D:\\User Files\\Documents\\SEGGER Embedded Studio for ARM Projects\\Rainbow\\Kinetis_KEA\\Source\\Kinetis_KEA_Startup.s"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "D:\\User Files\\Documents\\SEGGER Embedded Studio for ARM Projects\\Rainbow\\Kinetis_KEA\\Source\\Kinetis_KEA_Startup.s"
# 47 "D:\\User Files\\Documents\\SEGGER Embedded Studio for ARM Projects\\Rainbow\\Kinetis_KEA\\Source\\Kinetis_KEA_Startup.s"
  .syntax unified

  .global Reset_Handler
  .extern _vectors

  .section .init, "ax"
  .thumb_func

  .equ VTOR_REG, 0xE000ED08





Reset_Handler:


  ldr r0, =__RAM_segment_end__
  ldr r1, =0x7
  bics r0, r1
  mov sp, r0




  ldr r0, =SystemInit
  blx r0
# 99 "D:\\User Files\\Documents\\SEGGER Embedded Studio for ARM Projects\\Rainbow\\Kinetis_KEA\\Source\\Kinetis_KEA_Startup.s"
  ldr r0, =VTOR_REG



  ldr r1, =_vectors

  str r1, [r0]



  b _start
