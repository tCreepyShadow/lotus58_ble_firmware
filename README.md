# Lotus 58 ZMK Module

This repo defines the zmk module for the Lotus58 BLE keyboard by tweetydabird.

## How to build

Follow the instruction in the [ZMK documentation](https://zmk.dev/docs/user-setup) up to the step **Add a keyboard** . Following the instructions under "my keyboard isn't listed" you'll noud to add this module to your ZMK configuration using the command `zmk module add https://github.com/tCreepyShadow/lotus58_ble_firmware`.
Wow, when using `zmk keyboard new` you should be able too search for "lotus58_ble". Afterwards you only need to select your hardware revision.

Since the module uses the Zephyr hardware model v2, you'll need to switch from ZMK v0.3 to it's main branch. You can do that with `zmk version main`

Right now the hardware revision support of the zmk cli is broken. You'll need to open build.yaml with `zmk code --build` and fix it. The file should have this included at the end.
```
include:
  - board: lotus58_ble_left//zmk@1.20
  - board: lotus58_ble_right//zmk@1.20
```
You need to move the revision after the board, but before the qualifiers. Like this: 
```
include:
  - board: lotus58_ble_left@1.20//zmk
  - board: lotus58_ble_right@1.20//zmk
```

Save the file and push the changes following the ZMK guide and you should get a firmware.