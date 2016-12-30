{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Terminal
    rxvt_unicode

    # Tools
    curl
    wget
    htop

    # Web
    chromium

    # Desktop Environment
    dmenu
    haskellPackages.xmobar
    haskellPackages.xmonad
    haskellPackages.xmonadContrib
    haskellPackages.xmonadExtras

  ];
}
