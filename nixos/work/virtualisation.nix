{ config, pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
      socketActivation = true;
      extraOptions = ''
        --insecure-registry docker-hub:5000
        --insecure-registry docker-hub:5043
      '';
    };
    virtualbox = {
      host.enable = false;
      guest.enable = true;
    };
  };
  nixpkgs.config.virtualbox.enableExtensionPack = true;
}
