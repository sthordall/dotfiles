{ config, pkgs, ... }:

{
  environment.variables.HTTP_PROXY = "http://127.0.0.1:3128/";
  environment.variables.HTTPS_PROXY = "http://127.0.0.1:3128/";
  networking = {
    hostname = "nixdev";
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
