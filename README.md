# Personal RetroArch shader collections
This is a shader preset collection that I personally use when playing games.

The goal is faithfulness to game developer intent while still being easy on the eyes

It's a result of weeks of experimentation and the final look is something I am finally satisfied with.

## Usage
Clone in `RETROARCH_DIR/shaders/shaders_slang` and load from the repo folder, for example: `RETROARCH_DIR/shaders/shaders_slang/bejn-shader-presets`.

It's important that you get the path right because slang presets use relative paths.

## CRT
The CRT presets use custom configured `ntsc-adaptive` and my own modified version of `crt-nobody` which is included in this repo.  
I have added an optional parameter that disables scanlines dynamically if source content display mode is 480i/576i (i.e. not 240p/288p).

There are variants for each of the common AV interfaces (RF, Composite, S-Video and RGB SCART) and a 2-phase and 3-phase variant of each except RGB.

What's the difference between 2-phase and 3-phase? I don't really know the technical details and I am too lazy to research it but can tell you from the pure end-user perspective:
- 2-phase is worse quality, there is significant jitter and more horizontal smearing - it's better for systems and games which use heavy horizontal dithering (Sega Genesis/Mega Drive being the prime example)
- 3-phase is much more tame, there is no visible jitter and much less horizontal smearing

## NOCRT
The goal with the NOCRT presets is making it look like original hardware is connected to a high-quality early 2000s LCD or plasma - I have compared a couple of real systems on a good Phillips LCD from 2004 and the output is almost identical.

There is no CRT pass (obviously) and the other difference is that I am using a pass of `smuberstep` to align the pixels and soften them a little bit before the NTSC passes.

## Recommended core presets:
While I do offer my recommendations here, in the end it all comes down to **personal preference** and I encourage you to experiment.

- Atari 2600: **RF**
- NES, Master System: **Composite**
- SNES, PS1, TG16/PCE: **S-Video**
- Genesis/Mega Drive: **2-Phase S-Video**
- PS2, GameCube/Wii, DOS: **RGB** or (**S-Video** if it looks too sharp)
- Arcade: Depends on the cabinet. I ususally use **S-Video** or **RGB**.

## Handhelds
I have three presets, one for GB/GBC/GBA, one for NDS/i and one for the PSP. They are very simple: color correction + `uniform-nearest` for better alignment.

Those games were made for tiny screens so authenticity here is impossible - better keep it simple instead of aiming for 100% authentic.

You can add an LCD shader if you like but I think they look like ass on large displays so I am not including any in my presets.

## Motion blur
Some games use ghosting properties of LCD and CRT displays to blend shadows or create transparency effects (F-Zero, Pilotwings, Link's Awakening, etc.).

For those games, you can PREPEND (Quick Menu -> Shaders -> Prepend Preset) the `motionblur/mix-frames.slangp` preset that is included with RetroArch.

I have not included it in my default presets since not many games need it and it makes the experience blurry - so it's better to do it per-game.

## Pixel Shift (for OLEDs)
I've also built a pixel rotation shader that moves the screen by tiny amounts in set intervals (can be configured.) It's meant for OLED displays, to mitigate the uneven usage of pixels created by scanlines and the CRT mask (it does NOT, however, mitigate uneven usage due to playing in 4:3, you'll just have to play stretched or use a border shader).

It also has an option to dynamically disable vertical shifting if display mode is 480i/576i (i.e. not 240p/288p, i.e. there are no scanlines).

To use pixel shift, APPEND (Quick Menu -> Shaders -> Append Preset) the `pixel-shift.slangp` preset found in the repo folder. Make sure you append it AFTER you already load the CRT preset!
