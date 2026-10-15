# gadgets-ppm

PPM for the gadgets of [polpo](https://github.com/polpo-system/polpo): reads the portable graymap
and pixmap formats (.pgm, .ppm), plain (P2, P3) and raw (P5, P6), and raw bitmaps (.pbm, P4) as
Oberon pictures; plain bitmaps (P1) are not read. With it, Pictures.Open reads them
(`pbm`, `pgm`, `ppm = PPM.InitPicture` in the section PictureConverters of Oberon.Text).

```
portia.Install gadgets-ppm
```

## What is here

    src/OLR.PPM.Mod     the reader
    tools/PPM.Tool
    test/PPMTest.Mod

PPM is by Wolfgang Ibl. The source comes from ETH Linux Oberon (OLR, 2017-06-18), converted from an Oberon text to plain
text; the first commit has it unchanged. It compiles unchanged with all five of polpo's compilers
(x86, ARM, ARMv7, RISC-V, MIPS).

## Tests

    PPMTest.Run      2 checks: a picture made, a 3 by 2 graymap written and read; it needs the
                     desktop's display

The license is GPL-3 (`LICENSE`); the code comes from ETH Oberon, whose license (`LICENSE.ETH`)
asks to keep its copyright notice and conditions, which `LICENSE.ETH` does.
