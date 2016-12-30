{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    gnumake

    # Haskell
    stack

    # .NET
    mono64
    fsharp
  ];
}
