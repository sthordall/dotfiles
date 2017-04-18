{ config, pkgs, ... }:

{
  imports =
    [
      ../environments/cli.nix
      ../environments/desktop.nix
      ../environments/development.nix
    ];

  users.extraUsers.sthordall = {
    isNormalUser = true;
    home = "/home/sthordall";
    description = "Stephan Thordal";
    extraGroups = [ "wheel" "networkmanager" "docker" "vboxsf" ];
    initialPassword = "sthordall";
  };

  boot = {
    loader = {
      grub = {
        enable = true;
        version = 2;
        device = "/dev/sda";
      };
    };
  };

  virtualisation = {
    docker = {
      enable = true;
      listenOptions = [ "/var/run/docker.sock" "0.0.0.0:2375" ];
    };
    virtualbox = {
      host.enable = false;
      guest.enable = true;
    };
  };

  nixpkgs.config.virtualbox.enableExtensionPack = true;

  networking = {
    hostName = "nixdev";
    firewall.enable = false;
    networkmanager.enable = true;
  };
}
