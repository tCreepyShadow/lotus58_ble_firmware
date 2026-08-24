# Lotus 58 ZMK Module

This repo defines the zmk module for the Lotus58 BLE keyboard by tweetydabird.


## How to build

Follow the instruction in the [ZMK documentation](https://zmk.dev/docs/user-setup) up to the step **Add a keyboard** . You'll noud to add this module to your ZMK configuration using the command

```
zmk module add https://github.com/tCreepyShadow/lotus58_ble_firmware
```

Now, when using `zmk keyboard new` you should be able too search for "lotus58_ble" and select it and your corresponding hardware revision.

Since the module uses the Zephyr hardware model v2, you'll need to switch from ZMK v0.3 to it's main branch. You can do that with `zmk version main`

Right now the hardware revision support of the ZMK cli is broken. You'll need to open build.yaml with `zmk code --build` and fix it. The file should have this included at the end. `@x.xx` is a placeholder for your specific version.

```
include:
  - board: lotus58_ble_left//zmk@x.xx
  - board: lotus58_ble_right//zmk@x.xx
```

You need to move the board revision after the board name, but before the board qualifiers. Like this: 

```
include:
  - board: lotus58_ble_left@x.xx//zmk
  - board: lotus58_ble_right@x.xx//zmk
```

Save the file and push the changes following the ZMK guide and you should get a firmware.


## How to customise

With `zmk code lotus58_ble` you can open the keymap and with `zmk code --conf lotus58_ble` the configuration file.

Make the changes you want to do, for example uncommenting these two lines by removing the hashes.

```
# Uncomment to enable the encoders.
#CONFIG_EC11=y
#CONFIG_EC11_TRIGGER_GLOBAL_THREAD=y
```

to

```
# Uncomment to enable the encoders.
CONFIG_EC11=y
CONFIG_EC11_TRIGGER_GLOBAL_THREAD=y
```

Now when building, the firmware will have the encoders enabled.


## ZMK Studio and Nice!View display

For these two features it's not enough to enable them in the configuration file, you'll also need to add them to the build.yaml

```
include:
  - board: lotus58_ble_left@x.xx//zmk
    shield: nice_view
    snippet: studio-rpc-usb-uart
    artifact-name: lotus58_ble_left_studio_display
  - board: lotus58_ble_right@x.xx//zmk
    shield: nice_view
    artifact-name: lotus58_ble_right_studio_display
```

The artifact-name just renames the .uf2 firmware files for clarity.