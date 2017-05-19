{ config, pkgs, ... }:

let
  unstable = (import (fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz) {
    inherit (config.nixpkgs) config system;
  }).pkgs;
in
{
  environment.systemPackages = with pkgs; [
    # Tools
    gnumake
    pgadmin
    meld
    unstable.emacs

    # Haskell
    unstable.stack

    # Go
    go

    # Python
    python
    python27Packages.pygments

    # .NET
    mono46
    unstable.fsharp41
    dotnetPackages.FSharpAutoComplete
    dotnetPackages.FSharpCompilerCodeDom
    dotnetPackages.FSharpCompilerService
    dotnetPackages.FSharpData
    dotnetPackages.FSharpFormatting
  ];
}
