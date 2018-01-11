{ config, pkgs, ... }:

let
  unstable = (import (fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz) {
      inherit (config.nixpkgs) config system;
    }).pkgs;
in
  {
    environment.systemPackages = with pkgs; [
      firefox-bin chromium
      vlc
      slack discord tdesktop
      rxvt_unicode urxvt_vtwheel
      keepass
      vscode
      libnotify
      librsvg
      font-awesome-ttf
      gtk-engine-murrine
      numix-gtk-theme
      paper-icon-theme
      xfce.gigolo
      xfce.gtk_xfce_engine
      xfce.xfce4_battery_plugin
      xfce.xfce4_clipman_plugin
      xfce.xfce4_datetime_plugin
      xfce.xfce4_genmon_plugin
      xfce.xfce4_systemload_plugin
      xfce.xfce4_xkb_plugin
      xfce.xfce4_whiskermenu_plugin
      xfce.xfce4taskmanager
    ];

    services.xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "caps:escape";
      displayManager.lightdm.enable = true;
      desktopManager.xfce.enable = true;
    };

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
