/*****************************************************************************
 *                   SEGGER Microcontroller GmbH & Co. KG                    *
 *            Solutions for real time microcontroller applications           *
 *****************************************************************************
 *                                                                           *
 *               (c) 2017 SEGGER Microcontroller GmbH & Co. KG               *
 *                                                                           *
 *           Internet: www.segger.com   Support: support@segger.com          *
 *                                                                           *
 *****************************************************************************/

/*****************************************************************************
 *                         Preprocessor Definitions                          *
 *                         ------------------------                          *
 * VECTORS_IN_RAM                                                            *
 *                                                                           *
 *   If defined, an area of RAM will large enough to store the vector table  *
 *   will be reserved.                                                       *
 *                                                                           *
 *****************************************************************************/

  .syntax unified
  .code 16

  .section .init, "ax"
  .align 0

/*****************************************************************************
 * Default Exception Handlers                                                *
 *****************************************************************************/

  .thumb_func
  .weak NMI_Handler
NMI_Handler:
  b .

  .thumb_func
  .weak HardFault_Handler
HardFault_Handler:
  b .

  .thumb_func
  .weak SVC_Handler
SVC_Handler:
  b .

  .thumb_func
  .weak PendSV_Handler
PendSV_Handler:
  b .

  .thumb_func
  .weak SysTick_Handler
SysTick_Handler:
  b .

  .thumb_func
Dummy_Handler:
  b .

#if defined(__OPTIMIZATION_SMALL)

  .weak FTMRE_IRQHandler
  .thumb_set FTMRE_IRQHandler,Dummy_Handler

  .weak PMC_IRQHandler
  .thumb_set PMC_IRQHandler,Dummy_Handler

  .weak IRQ_IRQHandler
  .thumb_set IRQ_IRQHandler,Dummy_Handler

  .weak I2C0_IRQHandler
  .thumb_set I2C0_IRQHandler,Dummy_Handler

  .weak I2C1_IRQHandler
  .thumb_set I2C1_IRQHandler,Dummy_Handler

  .weak SPI0_IRQHandler
  .thumb_set SPI0_IRQHandler,Dummy_Handler

  .weak SPI1_IRQHandler
  .thumb_set SPI1_IRQHandler,Dummy_Handler

  .weak UART0_IRQHandler
  .thumb_set UART0_IRQHandler,Dummy_Handler

  .weak UART1_IRQHandler
  .thumb_set UART1_IRQHandler,Dummy_Handler

  .weak UART2_IRQHandler
  .thumb_set UART2_IRQHandler,Dummy_Handler

  .weak ADC_IRQHandler
  .thumb_set ADC_IRQHandler,Dummy_Handler

  .weak ACMP0_IRQHandler
  .thumb_set ACMP0_IRQHandler,Dummy_Handler

  .weak FTM0_IRQHandler
  .thumb_set FTM0_IRQHandler,Dummy_Handler

  .weak FTM1_IRQHandler
  .thumb_set FTM1_IRQHandler,Dummy_Handler

  .weak FTM2_IRQHandler
  .thumb_set FTM2_IRQHandler,Dummy_Handler

  .weak RTC_IRQHandler
  .thumb_set RTC_IRQHandler,Dummy_Handler

  .weak ACMP1_IRQHandler
  .thumb_set ACMP1_IRQHandler,Dummy_Handler

  .weak PIT_CH0_IRQHandler
  .thumb_set PIT_CH0_IRQHandler,Dummy_Handler

  .weak PIT_CH1_IRQHandler
  .thumb_set PIT_CH1_IRQHandler,Dummy_Handler

  .weak KBI0_IRQHandler
  .thumb_set KBI0_IRQHandler,Dummy_Handler

  .weak KBI1_IRQHandler
  .thumb_set KBI1_IRQHandler,Dummy_Handler

  .weak ICS_IRQHandler
  .thumb_set ICS_IRQHandler,Dummy_Handler

  .weak WDOG_IRQHandler
  .thumb_set WDOG_IRQHandler,Dummy_Handler

  .weak PWT_IRQHandler
  .thumb_set PWT_IRQHandler,Dummy_Handler

  .weak MSCAN_RX_IRQHandler
  .thumb_set MSCAN_RX_IRQHandler,Dummy_Handler

  .weak MSCAN_TX_IRQHandler
  .thumb_set MSCAN_TX_IRQHandler,Dummy_Handler

#else

  .thumb_func
  .weak FTMRE_IRQHandler
FTMRE_IRQHandler:
  b .

  .thumb_func
  .weak PMC_IRQHandler
PMC_IRQHandler:
  b .

  .thumb_func
  .weak IRQ_IRQHandler
IRQ_IRQHandler:
  b .

  .thumb_func
  .weak I2C0_IRQHandler
I2C0_IRQHandler:
  b .

  .thumb_func
  .weak I2C1_IRQHandler
I2C1_IRQHandler:
  b .

  .thumb_func
  .weak SPI0_IRQHandler
SPI0_IRQHandler:
  b .

  .thumb_func
  .weak SPI1_IRQHandler
SPI1_IRQHandler:
  b .

  .thumb_func
  .weak UART0_IRQHandler
UART0_IRQHandler:
  b .

  .thumb_func
  .weak UART1_IRQHandler
UART1_IRQHandler:
  b .

  .thumb_func
  .weak UART2_IRQHandler
UART2_IRQHandler:
  b .

  .thumb_func
  .weak ADC_IRQHandler
ADC_IRQHandler:
  b .

  .thumb_func
  .weak ACMP0_IRQHandler
ACMP0_IRQHandler:
  b .

  .thumb_func
  .weak FTM0_IRQHandler
FTM0_IRQHandler:
  b .

  .thumb_func
  .weak FTM1_IRQHandler
FTM1_IRQHandler:
  b .

  .thumb_func
  .weak FTM2_IRQHandler
FTM2_IRQHandler:
  b .

  .thumb_func
  .weak RTC_IRQHandler
RTC_IRQHandler:
  b .

  .thumb_func
  .weak ACMP1_IRQHandler
ACMP1_IRQHandler:
  b .

  .thumb_func
  .weak PIT_CH0_IRQHandler
PIT_CH0_IRQHandler:
  b .

  .thumb_func
  .weak PIT_CH1_IRQHandler
PIT_CH1_IRQHandler:
  b .

  .thumb_func
  .weak KBI0_IRQHandler
KBI0_IRQHandler:
  b .

  .thumb_func
  .weak KBI1_IRQHandler
KBI1_IRQHandler:
  b .

  .thumb_func
  .weak ICS_IRQHandler
ICS_IRQHandler:
  b .

  .thumb_func
  .weak WDOG_IRQHandler
WDOG_IRQHandler:
  b .

  .thumb_func
  .weak PWT_IRQHandler
PWT_IRQHandler:
  b .

  .thumb_func
  .weak MSCAN_RX_IRQHandler
MSCAN_RX_IRQHandler:
  b .

  .thumb_func
  .weak MSCAN_TX_IRQHandler
MSCAN_TX_IRQHandler:
  b .

#endif

/*****************************************************************************
 * Vector Table                                                              *
 *****************************************************************************/

  .section .vectors, "ax"
  .align 0
  .global _vectors
  .extern __stack_end__
  .extern Reset_Handler

_vectors:
  .word __stack_end__
  .word Reset_Handler
  .word NMI_Handler
  .word HardFault_Handler
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word SVC_Handler
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word PendSV_Handler
  .word SysTick_Handler
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word FTMRE_IRQHandler
  .word PMC_IRQHandler
  .word IRQ_IRQHandler
  .word I2C0_IRQHandler
  .word I2C1_IRQHandler
  .word SPI0_IRQHandler
  .word SPI1_IRQHandler
  .word UART0_IRQHandler
  .word UART1_IRQHandler
  .word UART2_IRQHandler
  .word ADC_IRQHandler
  .word ACMP0_IRQHandler
  .word FTM0_IRQHandler
  .word FTM1_IRQHandler
  .word FTM2_IRQHandler
  .word RTC_IRQHandler
  .word ACMP1_IRQHandler
  .word PIT_CH0_IRQHandler
  .word PIT_CH1_IRQHandler
  .word KBI0_IRQHandler
  .word KBI1_IRQHandler
  .word Dummy_Handler /* Reserved */
  .word ICS_IRQHandler
  .word WDOG_IRQHandler
  .word PWT_IRQHandler
  .word MSCAN_RX_IRQHandler
  .word MSCAN_TX_IRQHandler
_vectors_end:

#if 1
  .section .vectors, "ax"
  // fill to 0x400 for the flash configuration field
  //.fill 0x400-(_vectors_end-_vectors), 1, 0xff
  .org 0x400, 0xFF
BackDoorKey:
  .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
#if defined(E_SERIES)
RESERVED:
  .byte 0xff, 0xff, 0xff, 0xff
EEPROT:
  .byte 0xff
FPROT:
  .byte 0xff
FSEC:
  .byte 0xfe
FOPT:
  .byte 0xff
#else
FPROT:
  .byte 0xff, 0xff, 0xff, 0xff
FSEC:
  .byte 0xfe
FOPT:
#if defined(MKL03Z4) || defined(MKL17Z4) || defined(MKL17Z644) || defined(MKL27Z4)  || defined(MKL27Z644) || defined(MKL33Z4) || defined(MKL33Z644) || defined(MKL43Z4)
  .byte 0x3b
#else 
  .byte 0xff
#endif
FEPROT:
  .byte 0xff
FDPROT:
  .byte 0xff
#endif
#endif

#ifdef VECTORS_IN_RAM
  .section .vectors_ram, "ax"
  .align 0
  .global _vectors_ram

_vectors_ram:
  .space _vectors_end - _vectors, 0
#endif
