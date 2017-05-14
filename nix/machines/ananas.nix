{ config, pkgs, ... }:

{
  imports =
    [
      ../environments/cli.nix
      ../environments/server.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "zfs" ];

  services.zfs.autoSnapshot.enable = true;
  services.zfs.autoScrub.enable = true;
  services.zfs.autoScrub.interval = "daily";

  users.extraGroups = {
    media.gid = 300;
    git.gid = 400;
  };

  users.extraUsers= {
    sthordall = {
      isNormalUser = true;
      home = "/home/sthordall";
      description = "Stephan Thordal";
      extraGroups = [ "users" "wheel" "networkmanager" "docker" ];
      initialPassword = "sthordall";
    };
    stabbynie = {
      isNormalUser = true;
      home = "/mnt/backup/users/stabbynie";
      extraGroups = [ "users" "media" ];
      initialPassword = "stabbynie";
    };
    media = {
      uid = 301;
      isSystemUser = true;
      group = "media";
      initialPassword = "media";
    };
    git = {
      uid = 402;
      isSystemUser = true;
      group = "git";
      initialPassword = "git";
    };
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
