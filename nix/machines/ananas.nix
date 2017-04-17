{ config, pkgs, ... }:

{
  imports =
    [
      ../environments/cli.nix
    ];

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
      extraOptions = ''-H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375'';
    };
    virtualbox = {
      host.enable = true;
      guest.enable = false;
    };
  };

  networking = {
    hostName = "ananas";
    firewall.enable = false;
    networkmanager.enable = true;
  };
}
