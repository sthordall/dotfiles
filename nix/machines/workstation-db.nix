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
  environment.variables.HTTP_PROXY = "http://127.0.0.1:3128/";
  environment.variables.HTTPS_PROXY = "http://127.0.0.1:3128/";

  networking = {
    hostName = "nixdev";
    domain = "danskenet.net";
    search = [ "danskenet.net" ];
    proxy.default = "http://127.0.0.1:3128/";
    firewall.enable = false;
    networkmanager.enable = true;
  };

  services.cntlm = {
    enable = true;
    username = "user";
    password = "password";
    domain = "domain";
    proxy = [ "proxyhost:port" ];
    extraConfig = ''
      NoProxy *.danskenet.net docker-hub
    '';
  };
}