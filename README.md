# Lotus58 BLE ZMK Module

This repo defines the ZMK module for the Lotus58 BLE keyboard by TweetyDaBird.


## How to build

Follow the instructions in the [ZMK documentation](https://zmk.dev/docs/user-setup) up to the step **Add a keyboard**. You'll need to add this module to your ZMK configuration using the command

```
zmk module add https://github.com/tCreepyShadow/lotus58_ble_firmware
```

Now, when using `zmk keyboard add` you should be able to search for "lotus58_ble" and select it and your corresponding hardware revision.

Since the module uses the Zephyr hardware model v2, you'll need to switch from ZMK v0.3 to its main branch. You can do that with `zmk version main`

Push the changes following the ZMK guide and you should get a firmware build.


## How to customise

With `zmk code lotus58_ble` you can open the keymap and with `zmk code --conf lotus58_ble` the configuration file.

Make the changes you want to do, for example uncommenting these two lines by removing the hashes.

```
# Uncomment to enable the encoders.
#CONFIG_EC11_TRIGGER_GLOBAL_THREAD=y
```

to

```
# Uncomment to enable the encoders.
CONFIG_EC11_TRIGGER_GLOBAL_THREAD=y
```

Now when building, the firmware will have the encoders enabled.


## ZMK Studio and nice!view display

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
