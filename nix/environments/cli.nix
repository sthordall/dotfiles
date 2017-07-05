{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  environment.systemPackages = with pkgs; [
    curl
    davfs2
    dos2unix
    git
    htop
    jq
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
