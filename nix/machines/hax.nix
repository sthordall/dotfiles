{ config, pkgs, ... }:

{
  imports =
    [
      ../environments/cli.nix
      ../environments/desktop.nix
      ../environments/development.nix
    ];

  users.extraUsers= {
    sthordall = {
      isNormalUser = true;
      home = "/home/sthordall";
      extraGroups = [ "users" "wheel" "networkmanager" "docker" ];
      initialPassword = "sthordall";
    };
    stabbynie = {
      isNormalUser = true;
      home = "/home/stabbynie";
      extraGroups = [ "users" "media" ];
      initialPassword = "stabbynie";
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
    hostName = "hax";
    firewall.enable = false;
    networkmanager.enable = true;
  };

  hardware.opengl.driSupport32Bit = true;
  services.xserver.videoDrivers = [ "intel" ];
  services.compton = {
    enable = true;
    fade = true;
    inactiveOpacity = "0.9";
    shadow = true;
    fadeDelta = 4;
  };
}
