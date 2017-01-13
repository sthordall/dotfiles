{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  users.extraUsers.sthordall = {
    isNormalUser = true;
    home = "/home/sthordall";
    description = "Stephan Thordal";
    extraGroups = [ "wheel" "networkmanager" "docker" "vboxsf" ];
    initialPassword = "sthordall";
  };
}
