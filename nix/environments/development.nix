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
    # Tools
    gnumake
    pgadmin
    meld

    # Haskell
    stack

    # Go
    go

    # Python
    python
    python27Packages.pygments

    # .NET
    mono46
    fsharp
    dotnetPackages.FSharpAutoComplete
    dotnetPackages.FSharpCompilerCodeDom
    dotnetPackages.FSharpCompilerService
    dotnetPackages.FSharpData
    dotnetPackages.FSharpFormatting
  ];
}
