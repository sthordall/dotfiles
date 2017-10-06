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
    kernel = {
      sysctl = {
        "vm.max_map_count" = 262144;
      };
    };
  };

  virtualisation = {
    docker = {
      enable = true;
      liveRestore = false;
      listenOptions = [ "/var/run/docker.sock" "0.0.0.0:2375" ];
      extraOptions = ''
        --insecure-registry db-docker-fxcore.artifactory.danskenet.net
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
      NoProxy *.danskenet.net docker-hub nixdev
    '';
  };
}
