# RetroArch Shader Preset Collection
This is the shader preset collection I personally use. The goal is game developer intent authenticity while still being easy on the eyes.

## Usage
Clone in `retroarch_dir/shaders/shaders_slang` and load from the repo folder.  
It's important you get the path right because slang presets use relative paths.

## CRT
The CRT presets use custom configured `ntsc-adaptive` and my own modified version of `crt-nobody` which is included in this repo. I have added an optional parameter that disables scanlines automatically if source content size iz above 240p.

### Recommended core presets:
- Atari 2600 - `crt-rf`
- NES, Master System - `crt-composite`
- SNES, PS1, N64, PS2, GameCube/Wii - `crt-svideo`
- Genesis/Mega Drive - `crt-svideo-2phase` - Blends dithering effects correctly
- Arcade - Depends on the cabinet. I usually use `crt-svideo` or `crt-rgb`

## Handhelds
I have three presets, one for GB/GBC/GBA, one for NDS/i and one for the PSP. They are very simple: color correction + `uniform-nearest` for better alignment.  
Those games were made for tiny screens and LCD shaders look like ass on large displays, better keep it simple here instead of aiming for 100% authentic.

### Recommended core presets:
- GB, GBC, GBA - `handheld-gb-family`
- DS, DSi - `handheld-ds-family`
- PSP - `handheld-psp`

## Motion blur
Some games use ghosting properties of LCD displays or CRTs to blend shadows or create a motion blur effect (F-Zero, Pilotwings, Link's Awakening, etc.).  
For those games, you can PREPEND (Quick Menu -> Shaders -> Prepend Preset) the `motionblur/mix-frames.slangp` preset that is included with RetroArch.

## Pixel Shift (for OLEDs)
I've also built a pixel rotation shader that moves the screen by tiny amounts in set intervals (can be configured.) It's meant for OLED displays, to mitigate the uneven usage of pixels created by scanlines and the CRT mask (it does not, however, mitigate uneven usage due to playing in 4:3, you'll just have to play stretched or use a border shader.)

To use pixel shift, APPEND (Quick Menu -> Shaders -> Append Preset) the `pixel-shift.slangp` preset found in the repo folder. Make sure you append it AFTER you already load the CRT preset!
