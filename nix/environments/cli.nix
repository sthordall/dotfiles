{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  environment.systemPackages = with pkgs; [
    # Tools
    unzip
    dos2unix
    curl
    wget
    htop
    rclone

    # Shell
    zsh
    oh-my-zsh
    zsh-completions
    nix-zsh-completions

    # Vim
    vimHugeX

    # Git
    git
  ];

  services = {
    openssh.enable = true;
  };
}
