{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libpulseaudio
    mopidy
    vlc
  ];

  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;

}
