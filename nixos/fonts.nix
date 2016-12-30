{ config, pkgs, ... }:

{
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      anonymousPro
      cantarell_fonts
      corefonts
      dejavu_fonts
      fira-mono
      font-droid
      inconsolata
      liberation_ttf
      terminus_font
      vistafonts
      powerline-fonts
    ];
  };
}
