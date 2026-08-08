# RetroArch Shader Preset Collection
This is a shader preset collection that I personally use when playing games. The goal is faithfulness to game developer intent while still being easy on the eyes.

## Usage
Clone in `RETROARCH_DIR/shaders/shaders_slang` and load from the repo folder, for example: `RETROARCH_DIR/shaders/shaders_slang/bejn-shader-presets`.  
It's important that you get the path right because slang presets use relative paths.

## CRT
The CRT presets use custom configured `ntsc-adaptive` and my own modified version of `crt-nobody` which is included in this repo. I have added an optional parameter that disables scanlines dynamically if source content display mode is 480i/576i (i.e. not 240p/288p).

### Recommended system presets:
- Atari 2600 - `crt-rf`
- NES, Master System - `crt-composite`
- SNES, PS1, N64, TG16/PCE - `crt-svideo`
- Genesis/Mega Drive - `crt-svideo-2phase` - Blends dithering correctly without relying on heuristics
- PS2, GameCube/Wii, DOS - `crt-rgb` or (`crt-svideo` if it looks too sharp)
- Arcade - Depends on the cabinet. I usually use `crt-svideo` or `crt-rgb` for raster displays. Vector-display cabinets are best left as-is.

## Handhelds
I have three presets, one for GB/GBC/GBA, one for NDS/i and one for the PSP. They are very simple: color correction + `uniform-nearest` for better alignment.  
Those games were made for tiny screens so authenticity here is impossible - better keep it simple instead of aiming for 100% authentic. You can use an LCD shader if you like but I think they look like ass on large displays so I am not including any in my presets.

### Recommended system presets:
- GB, GBC, GBA - `handheld-gb-family`
- DS, DSi - `handheld-ds-family`
- PSP - `handheld-psp`

## Ghosting
Some games use ghosting properties of LCD and CRT displays to blend shadows or create transparency effects (F-Zero, Pilotwings, Link's Awakening, etc.).  
For those games, you can PREPEND (Quick Menu -> Shaders -> Prepend Preset) the `motionblur/mix-frames.slangp` preset that is included with RetroArch.  
I have not included it in my default presets since not many games need it and it makes the experience blurry - so it's better to do it per-game.

## Pixel Shift (for OLEDs)
I've also built a pixel rotation shader that moves the screen by tiny amounts in set intervals (can be configured.) It's meant for OLED displays, to mitigate the uneven usage of pixels created by scanlines and the CRT mask (it does NOT, however, mitigate uneven usage due to playing in 4:3, you'll just have to play stretched or use a border shader).

It also has an option to dynamically disable vertical shifting if display mode is 480i/576i (i.e. not 240p/288p, i.e. there are no scanlines).

To use pixel shift, APPEND (Quick Menu -> Shaders -> Append Preset) the `pixel-shift.slangp` preset found in the repo folder. Make sure you append it AFTER you already load the CRT preset!
