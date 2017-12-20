{ config, pkgs, ... }:

let
  unstable = (import (fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz) {
      inherit (config.nixpkgs) config system;
    }).pkgs;
in
  {
    nixpkgs.config.packageOverrides = pkgs: rec {
      elm-format-linked = pkgs.elmPackages.elm-format.overrideDerivation (oldAttrs: {
        postInstall = ''ln -s $out/bin/elm-format-0.18 $out/bin/elm-format'';
      });
    };

    environment.systemPackages = with pkgs; with elmPackages; with dotnetPackages; [
      # Tools
      gnumake
      pgadmin
      meld
      emacs
      gcc

      # Elm
      elm
      elm-compiler
      elm-format-linked
      elm-make
      elm-package
      elm-reactor
      elm-repl

      # JS
      nodejs

      # Haskell
      unstable.stack
      ghc
      cabal-install
      cabal2nix

      # Go
      go gotools hugo

      # Python
      python
      python27Packages.pygments

      # .NET
      mono46
      unstable.fsharp41
      unstable.dotnet-sdk
      FSharpAutoComplete
      FSharpCompilerCodeDom
      FSharpCompilerService
      FSharpData
      FSharpFormatting
    ];
  }
