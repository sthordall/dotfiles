
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
    vimHugeX

    # Git
    git

    # Tools
    curl
    wget
    htop
    gnumake
    pgadmin

    # Haskell
    stack

    # Python
    python

    # .NET
    mono46
    fsharp
    dotnetPackages.FSharpAutoComplete
    dotnetPackages.FSharpCompilerCodeDom
    dotnetPackages.FSharpCompilerService
    dotnetPackages.FSharpData
    dotnetPackages.FSharpFormatting

    # Tex
    texlive.combined.scheme-full
  ];

  services = {
    openssh.enable = true;
  };
}
