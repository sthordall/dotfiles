{ config, pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
      socketActivation = true;
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
