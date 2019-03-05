/*
Copyright 2012 Jun Wako <wakojun@gmail.com>
Copyright 2018 Jack Humbert <jack.humb@gmail.com>
Copyright 2019 Jeremy Day <jadaytime@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef CONFIG_H
#define CONFIG_H

#include "config_common.h"

/* USB Device descriptor parameter */
#define VENDOR_ID       0xFEED
#define PRODUCT_ID      0x6061
#define MANUFACTURER    OLKB
#define PRODUCT         Preonic
#define DEVICE_VER      0x0003
#define DESCRIPTION     A compact ortholinear keyboard

/* Key matrix size */
#define MATRIX_ROWS 10
#define MATRIX_COLS 6

/* Planck PCB default pin-out */
#define MATRIX_ROW_PINS { D2, D5, B5, B6, D3 }
#define MATRIX_COL_PINS { F1, F0, B0, C7, F4, F5, F6, F7, D4, D6, B4, D7 }
#define UNUSED_PINS

#define QMK_ESC_OUTPUT F1
#define QMK_ESC_INPUT B5
#define QMK_LED     E6
#define QMK_SPEAKER C6

#define BACKLIGHT_PIN B7

#define NUMBER_OF_ENCODERS 1
#define ENCODERS_PAD_A { B12 }
#define ENCODERS_PAD_B { B13 }

#define MUSIC_MAP

/* COL2ROW or ROW2COL */
#define DIODE_DIRECTION COL2ROW

/* Number of backlight levels */
#define BACKLIGHT_LEVELS 3

#define DEBOUNCE 6

/* Set 0 if debouncing isn't needed */
#define DEBOUNCING_DELAY 5

/* Mechanical locking support. Use KC_LCAP, KC_LNUM or KC_LSCR instead in keymap */
#define LOCKING_SUPPORT_ENABLE
/* Locking resynchronize hack */
#define LOCKING_RESYNC_ENABLE

#define WS2812_LED_N 2
#define RGBLED_NUM WS2812_LED_N
#define WS2812_TIM_N 2
#define WS2812_TIM_CH 2
#define PORT_WS2812     GPIOA
#define PIN_WS2812      1
#define WS2812_DMA_STREAM STM32_DMA1_STREAM2  // DMA stream for TIMx_UP (look up in reference manual under DMA Channel selection)

#endif
