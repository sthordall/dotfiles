{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    chromium firefox

    vlc

    slack discord

    rxvt_unicode urxvt_vtwheel

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
