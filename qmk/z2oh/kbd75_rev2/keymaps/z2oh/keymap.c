#include QMK_KEYBOARD_H

#define _______ KC_TRNS

// Layer names
#define _COLEMAK 0
#define _QWERTY 1
#define _RAISE 2
#define _LOWER 2

enum keycodes {
  COLEMAK = SAFE_RANGE,
  QWERTY,
  DYNAMIC_MACRO_RANGE,
};

#include "dynamic_macro.h"

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

  [_COLEMAK] = LAYOUT(
    KC_ESC,   KC_F1,         KC_F2,    KC_F3,    KC_F4,    KC_F5,    KC_F6,                KC_F7,    KC_F8,    KC_F9,    KC_F10,   KC_F11,        KC_F12,   KC_DEL,   MO(_RAISE),    KC_BTN1,
    KC_GRV,   KC_1,          KC_2,     KC_3,     KC_4,     KC_5,     KC_6,                 KC_7,     KC_8,     KC_9,     KC_0,     KC_MINS,       KC_EQL,   KC_DEL,   KC_BSPC,       KC_HOME,
    KC_TAB,   KC_Q,          KC_W,     KC_F,     KC_P,     KC_G,     KC_J,                 KC_L,     KC_U,     KC_Y,     KC_SCLN,  KC_LBRC,       KC_RBRC,  KC_BSLS,                 KC_PGUP,
    KC_BSPC,  KC_A,          KC_R,     KC_S,     KC_T,     KC_D,     KC_H,                 KC_N,     KC_E,     KC_I,     KC_O,     KC_QUOT,                           KC_ENT,        KC_PGDN,
    KC_LSPO,  MO(_RAISE),    KC_Z,     KC_X,     KC_C,     KC_V,     KC_B,                 KC_K,     KC_M,     KC_COMM,  KC_DOT,   KC_SLSH,       KC_RSPC,            KC_UP,         KC_END,
    KC_LCTL,  KC_LGUI,       KC_LALT,                      KC_SPC,   LT(_LOWER, KC_SPC),   KC_SPC,                       KC_RALT,  MO(_RAISE),    KC_RCTL,  KC_LEFT,  KC_DOWN,       KC_RGHT
  ),

  [_QWERTY] = LAYOUT(
    KC_ESC,   KC_F1,         KC_F2,    KC_F3,    KC_F4,    KC_F5,    KC_F6,                KC_F7,    KC_F8,    KC_F9,    KC_F10,   KC_F11,        KC_F12,   KC_DEL,   MO(_RAISE),    KC_BTN1,
    KC_GRV,   KC_1,          KC_2,     KC_3,     KC_4,     KC_5,     KC_6,                 KC_7,     KC_8,     KC_9,     KC_0,     KC_MINS,       KC_EQL,   KC_DEL,   KC_BSPC,       KC_HOME,
    KC_TAB,   KC_Q,          KC_W,     KC_E,     KC_R,     KC_T,     KC_Y,                 KC_U,     KC_I,     KC_O,     KC_P,     KC_LBRC,       KC_RBRC,  KC_BSLS,                 KC_PGUP,
    KC_BSPC,  KC_A,          KC_S,     KC_D,     KC_F,     KC_G,     KC_H,                 KC_J,     KC_K,     KC_L,     KC_SCLN,  KC_QUOT,                           KC_ENT,        KC_PGDN,
    KC_LSPO,  MO(_RAISE),    KC_Z,     KC_X,     KC_C,     KC_V,     KC_B,                 KC_N,     KC_M,     KC_COMM,  KC_DOT,   KC_SLSH,       KC_RSPC,            KC_UP,         KC_END,
    KC_LCTL,  KC_LGUI,       KC_LALT,                      KC_SPC,   LT(_LOWER, KC_SPC),   KC_SPC,                       KC_RALT,  MO(_RAISE),    KC_RCTL,  KC_LEFT,  KC_DOWN,       KC_RGHT
  ),

  [_RAISE] = LAYOUT(
    DYN_REC_STOP,   DYN_REC_START1,   DYN_REC_START2,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,   KC_INS,
         _______,  DYN_MACRO_PLAY1,  DYN_MACRO_PLAY2,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  RESET,    _______,
         _______,          RGB_TOG,          RGB_MOD,  RGB_HUI,  RGB_HUD,  RGB_SAI,  RGB_SAD,  RGB_VAI,  RGB_VAD,  _______,  _______,  _______,  _______,  _______,            COLEMAK,
         _______,          _______,          _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,                      _______,  QWERTY ,
         _______,          _______,          _______,  _______,  BL_DEC,   BL_TOGG,  BL_INC,   BL_STEP,  _______,  _______,  _______,  _______,  _______,            _______,  _______,
         _______,          _______,          _______,                      _______,  _______,  _______,                      _______,  _______,  _______,  _______,  _______,  _______
  ),

  [_LOWER] = LAYOUT(
    _______,  _______,  _______,  _______,  _______,   _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,
    _______,  _______,  _______,  _______,  _______,   _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,
    _______,  _______,  _______,  KC_UP,    _______,   _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,
    _______,  _______,  KC_LEFT,  KC_DOWN,  KC_RIGHT,  _______,  _______,  _______,  _______,  _______,  _______,  _______,                      _______,  _______,
    _______,  _______,  _______,  _______,  _______,   _______,  _______,  _______,  _______,  _______,  _______,  _______,  _______,            _______,  _______,
    _______,  _______,  _______,                       _______,  _______,  _______,                      _______,  _______,  _______,  _______,  _______,  _______
  ),
};

void led_set_user(uint8_t usb_led) {
    if (usb_led & (1 << USB_LED_CAPS_LOCK)) {
        DDRB |= (1 << 2); PORTB &= ~(1 << 2);
    } else {
        DDRB &= ~(1 << 2); PORTB &= ~(1 << 2);
    }
};

void persistent_default_layer_set(uint16_t default_layer) {
  eeconfig_update_default_layer(default_layer);
  default_layer_set(default_layer);
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  if (!process_record_dynamic_macro(keycode, record)) {
    return false;
  }

  switch (keycode) {
    case COLEMAK:
      if (record->event.pressed) {
        persistent_default_layer_set(1UL<<_COLEMAK);
      }
      break;
    case QWERTY:
      if (record->event.pressed) {
        persistent_default_layer_set(1UL<<_QWERTY);
      }
      break;
  }
  return true;
};
