{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  environment.systemPackages = with pkgs; [
    curl
    dos2unix
    git
    htop
    nix-zsh-completions
    oh-my-zsh
    rclone
    tmux
    unzip
    vimHugeX
    wget
    zsh
    zsh-completions
  ];

  services = {
    openssh.enable = true;
  };
}
