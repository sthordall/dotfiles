
{ config, pkgs, ... }:

{
  nixpkgs.config = {
    packageOverrides = super: let self = super.pkgs; in {
      fsharp = super.fsharp.override {
        mono = pkgs.mono46;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    # Shell
    zsh
    oh-my-zsh
    zsh-completions
    nix-zsh-completions

    # Vim
    vim

    # Git
    git

    # Tools
    curl
    wget
    htop
    gnumake

    # Haskell
    stack

    # .NET
    mono46
    fsharp
  ];

  services = {
    openssh.enable = true;
  };
}
