{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; with dotnetPackages; [
    # Tools
    gnumake
    meld
    gcc
    universal-ctags

    # JS
    nodejs

    # Haskell
    stack
    ghc
    cabal-install
    cabal2nix

    # Go
    go gotools hugo

    # Python
    python
    python27Packages.pygments

    # .NET
    mono54
    fsharp41
    dotnet-sdk
    FSharpAutoComplete
    FSharpCompilerCodeDom
    FSharpCompilerService
    FSharpData
    FSharpFormatting
  ];
}
