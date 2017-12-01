{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  environment.systemPackages = with pkgs; [
    ag
    awscli
    curl
    davfs2
    dos2unix
    git
    htop
    jq
    mosh
    nix-zsh-completions
    oh-my-zsh
    rclone
    taskwarrior
    tmux
    unzip
    vimHugeX
    wget
    xclip
    zsh
    zsh-completions
  ];

  services = {
    openssh.enable = true;
  };
}
