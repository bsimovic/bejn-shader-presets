# Personal RetroArch shader collections
This is a shader preset collection that I personally use when playing games.

The goal is faithfulness to game developer intent while still being easy on the eyes

## Usage
Clone in `RETROARCH_DIR/shaders/shaders_slang` and load from the repo folder, for example: `RETROARCH_DIR/shaders/shaders_slang/bejn-shader-presets`.

It's important that you get the path right because slang presets use relative paths.

## CRT
The CRT presets use custom configured `ntsc/ntsc-adaptive.slangp` (except for RGB) and my own modified version of `crt-nobody` which is included in this repo. I have added an optional parameter that disables scanlines dynamically if source content display mode is 480i/576i (i.e. not 240p/288p).

There are variants for simulating each of the common AV interfaces (RF, Composite, S-Video and RGB SCART).

Keep in mind, the CRT mask scales with display resolution - meaning it will look good on high-res displays (Full HD and higher - looks especially good in 4K) but also looks like crap on lower resolution screens. For low-res displays, use the NOCRT presets.

## NOCRT
The goal with the NOCRT presets is making it look like original hardware is connected to a non-crt display through a high quality scaler - or simply directly to an old high quality LCD or plasma screen.

What's the difference here instead of just using any random ntsc shader? It's the added pre-pass of `pixel-art-scaling/smuberstep.slangp` - it makes it look a whole lot nicer and much closer to the intent I described above.

## Recommended core presets:
While I do offer my recommendations here, in the end it all comes down to **personal preference** and I encourage you to experiment.

- Atari 2600: **RF**
- NES, Master System: **Composite**
- SNES, PS1, TG16/PCE, Genesis/Mega Drive: **S-Video** or **Composite**
- PS2, GameCube/Wii, DOS: **RGB** or (**S-Video** if it looks too sharp)
- Arcade: Depends on the cabinet. I usually use **S-Video** or **RGB**.

## Handhelds
I have three presets, one for GB/GBC/GBA, one for NDS/i and one for the PSP. They are very simple: color correction + `pixel-art-scaling/uniform-nearest.slangp` for better alignment.

Those games were made for tiny screens so authenticity here is impossible - better keep it simple instead of aiming for 100% authentic.

If playing on a smartphone though, you should try an LCD shader (in the `handheld` folder included with default RetroArch shaders) - they look like ass on large screens so am not including any, but on a phone screen they look incredible!

## Motion blur
Some games use ghosting properties of LCD and CRT displays to blend shadows or create transparency effects (F-Zero, Pilotwings, Link's Awakening, etc.).

For those games, you can PREPEND (Quick Menu -> Shaders -> Prepend Preset) the `motionblur/mix-frames.slangp` preset that is included with RetroArch.

I have not included it in my default presets since not many games need it and it makes the experience blurry - so it's better to do it per-game.

## Pixel Shift (for OLEDs)
I've written a pixel rotation shader that moves the screen by tiny amounts in set intervals (can be configured.) It's meant for OLED displays, to mitigate the uneven usage of pixels created by scanlines and the CRT mask (it does NOT, however, mitigate uneven usage due to playing in 4:3, you'll just have to play stretched or use a border shader).

It also has an option to dynamically disable vertical shifting if display mode is 480i/576i (i.e. not 240p/288p, i.e. there are no scanlines).

To use pixel shift, APPEND (Quick Menu -> Shaders -> Append Preset) the `bejn-shader-presets/misc/pixel-shift.slangp` preset found in the repo folder. Make sure you append it AFTER you already load the CRT preset!
