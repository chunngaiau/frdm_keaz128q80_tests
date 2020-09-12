#include <SKEAZ1284.h>
#include <stdint.h>
#include <stdbool.h>
#include <math.h>
#include <stdlib.h>

#define PTE4 4  // BTN_0
#define PTE5 5  // BTN_1

#define PTE7 7  // Blue LED   FTM1_CH1
#define PTH0 24 // Red LED    FTM2_CH0
#define PTH1 25 // Green LED  FTM2_CH1

#define INCREMENT 50000

int main(void) {
  // Enable clock gate
  SIM_SCGC |= SIM_SCGC_FTM2_MASK;
  SIM_SCGC |= SIM_SCGC_FTM1_MASK;

  SIM_PINSEL1 |= SIM_PINSEL1_FTM2PS0(1);  // Red LED
  SIM_PINSEL1 |= SIM_PINSEL1_FTM2PS1(1);  // Green LED
  SIM_PINSEL0 |= SIM_PINSEL_FTM1PS1_MASK; // Blue LED

  FTM2_SC |= FTM_SC_CLKS(1); // Enable FTM2 (and its clock source)
  FTM1_SC |= FTM_SC_CLKS(1); // Enable FTM1
  
  // Enable Edge-aligned PWM with Low True mode
  FTM2_C0SC = FTM_CnSC_MSB_MASK | FTM_CnSC_ELSA_MASK;
  FTM2_C1SC = FTM_CnSC_MSB_MASK | FTM_CnSC_ELSA_MASK;

  FTM1_C1SC = FTM_CnSC_MSB_MASK | FTM_CnSC_ELSA_MASK;

  FTM2_MOD = 100;
  FTM2_C0V = 0;
  FTM2_C1V = 0;

  FTM1_MOD = 100;
  FTM1_C1V = 0;

  // Enable button input
  GPIOB_PDDR |= (0 << PTE4) | (0 << PTE5);
  GPIOB_PIDR ^= (1 << PTE4) | (1 << PTE5);
  
  int counter = 0;

  int hue = 0;
  bool dir = false;

  int rVal;
  int gVal;
  int bVal;

  int buttonVal;
  int lastButtonVal;

  int button2Val;

  for (;;) {
    counter++;
    if (counter == INCREMENT) {
      counter = 0;
      
      if (dir) {
        hue++;
        if (hue >= 300) {
          hue = 0;
        }
      } else {
        hue--;
        if (hue <= 0) {
          hue = 300;
        }
      }
      
      rVal = (uint32_t) fmax( abs(hue - 150) -  50, 0);
      gVal = (uint32_t) fmax(-abs(hue - 100) + 100, 0);
      bVal = (uint32_t) fmax(-abs(hue - 200) + 100, 0);

      buttonVal = (GPIOB_PDIR & (1 << PTE4)) >> PTE4;
      button2Val = (GPIOB_PDIR & (1 << PTE5)) >> PTE5;

      if ((lastButtonVal == 0) && (buttonVal == 1)) {
        dir = !dir;
      }

      lastButtonVal = buttonVal;
      
      FTM2_C0V = (button2Val == 1) ? 0 : rVal;
      FTM2_C1V = (button2Val == 1) ? 0 : gVal;
      FTM1_C1V = (button2Val == 1) ? 0 : bVal;
    }
  }

  return 0;
}