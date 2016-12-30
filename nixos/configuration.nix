{ config, pkgs, ... }:

{
  imports =
    [
      ./work/virtualisation.nix
      ./work/networking.nix
      ./packages.nix
      ./fonts.nix
      ./development.nix
      ./zsh.nix
      ./vim.nix
      ./git.nix
      ./users.nix
      ./services.nix
    ];

  nixpkgs.config = {
    allowUnfree = true;
    pulseaudio = true;
  };


}
