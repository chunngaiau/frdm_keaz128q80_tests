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

#ifndef __Kinetis_KEAxx_h
#define __Kinetis_KEAxx_h

#if defined(SKEAZ128xxx4) || defined(SKEAZ64xxx4)

#include "SKEAZ1284.h"

#elif defined(SKEAZN8xxx4)

#include "SKEAZN84.h"

#elif defined(SKEAZN16xxx2) || defined(SKEAZN32xxx2) || defined(SKEAZN64xxx2)

#include "SKEAZN642.h"

#endif

#endif
