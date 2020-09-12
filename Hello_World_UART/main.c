/*
  UART Hello World Test

  The OpenSDA UART module is connected to UART2

  - UART2_RX <--> PTD6
  - UART2_TX <--> PTD7

*/

#include <SKEAZ1284.h>

#define BLUE_LED 7;

// Local Function Prototypes
void sendChar(uint8_t send);
void sendString(char to_send[]);
uint8_t getChar();

// Main Function
int main() {
  // Set up clock to 40MHz System Clock, 20MHz Bus Clock
  ICS_C1 |= ICS_C1_IRCLKEN_MASK;        // Enable the internal reference clock
  ICS_C3 = 0x90;                        // Set trim value so reference clock is 31.25 kHz
  while (!(ICS_S & ICS_S_LOCK_MASK)) {
    ;                                   // Wait for PLL, running at 40 MHz (1280 * 31.25 kHz)
  }
  ICS_C2 |= ICS_C2_BDIV(1);             // BDIV=2, Bus clock = 20 MHz
  ICS_S |= ICS_S_LOLS_MASK;             // Clear Loss of lock sticky bit

  // Connect bus clock to UART2
  SIM_SCGC |= SIM_SCGC_UART2_MASK;

  // Set Baud Rate
  int BR = 128; // (20MHz) / (16 * 128) = 9600 Baud
  UART2_BDL = BR & 0xFF;
  UART2_BDH |= (BR >> 8) & 0x1F;

  // Enable Transmitter and Receiver
  UART2_C2 |= 1 << UART_C2_TE_SHIFT;
  UART2_C2 |= 1 << UART_C2_RE_SHIFT;

  // Enable Receiver Interrupt
  UART2_C2 |= 1 << UART_C2_RIE_SHIFT;
  NVIC_EnableIRQ(UART2_IRQn);

  // Hello World!
  sendString("Hello World!\r\n");

  // Set up led pin
  GPIOB_PDDR |= 1 << BLUE_LED;
  GPIOB_PSOR |= 1 << BLUE_LED; // Set is Off for LED

  for (;;) {
    ;
  }

  return 0;
}

void UART2_IRQHandler() {
  GPIOB_PCOR |= 1 << BLUE_LED;
  (void) UART2_S1;
  uint8_t temp = getChar();
  sendChar(temp);
  GPIOB_PSOR |= 1 << BLUE_LED;
}

void sendChar(uint8_t send) {
  while ((UART2_S1 & UART_S1_TDRE_MASK) == 0) {
    ; // Wait for transmit buffer to be empty
  }
  (void) UART2_S1; // Read to clear
  UART2_D = send; // Send char
}

void sendString(char to_send[]) {
  int i = 0;
  while (to_send[i] != '\0') {
    sendChar(to_send[i]);
    i++;
  }
}

uint8_t getChar() {
  while ((UART2_S1 & UART_S1_RDRF_MASK) == 0) {
    ; // Wait for receive buffer to be full
  }
  (void) UART2_S1; // Read to clear
  uint8_t received = UART2_D;
  return received;
}