#include <SKEAZ1284.h>

#define PTE7 7  // Blue LED   FTM1_CH1
#define PTH0 24 // Red LED    FTM2_CH0
#define PTH1 25 // Green LED  FTM2_CH1

#define INCREMENT 500000

int main(void) {
  int counter = 0;

  GPIOB_PDDR |= (1 << PTE7) | (1 << PTH0) | (1 << PTH1);

  GPIOB_PSOR |= (1 << PTE7) | (1 << PTH1); // Set Red

  for (;;) {
    counter++;

    switch (counter) {
      case 1 * INCREMENT: GPIOB_PTOR |= (1 << PTH1); break;              // Set Yellow
      case 2 * INCREMENT: GPIOB_PTOR |= (1 << PTH0); break;              // Set Green
      case 3 * INCREMENT: GPIOB_PTOR |= (1 << PTE7); break;              // Set Cyan
      case 4 * INCREMENT: GPIOB_PTOR |= (1 << PTH1); break;              // Set Blue
      case 5 * INCREMENT: GPIOB_PTOR |= (1 << PTH0); break;              // Set Magenta
      case 6 * INCREMENT: GPIOB_PTOR |= (1 << PTE7); counter = 1; break; // Set Red and Reset
    }
  }

  return 0;
}