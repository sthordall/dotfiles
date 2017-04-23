{ config, pkgs, ... }:

{
  imports =
    [
      ../environments/cli.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "zfs" ];

  users.extraUsers.sthordall = {
    isNormalUser = true;
    home = "/home/sthordall";
    description = "Stephan Thordal";
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    initialPassword = "sthordall";
  };

  virtualisation = {
    docker = {
      enable = true;
      listenOptions = [ "/var/run/docker.sock" "0.0.0.0:2375" ];
    };
    virtualbox = {
      host.enable = true;
      guest.enable = false;
    };
  };

  networking = {
    hostName = "ananas";
    hostId = "1337beef";
    firewall.enable = false;
    networkmanager.enable = true;
  };
}
