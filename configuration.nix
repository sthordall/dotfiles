{ config, pkgs, ... }:

{
  imports =
    [
      # Common
      ./nix/bootloader.nix
      ./nix/desktop.nix
      ./nix/development.nix
      ./nix/fonts.nix
      ./nix/users.nix

      # Machine Specific (Choose machine nix file)
      ./nix/machines/workstation-db.nix
    ];

  nixpkgs.config = {
    allowUnfree = true;
    pulseaudio = true;
  };

  # Link dotfiles to primary user
  # - Script args: username, email, home_dir
  # - Remember to register user under 'nix/users.nix'
  system.activationScripts = {
    linkDotfiles = {
      text = ''
        cd /etc/nixos
        /etc/nixos/link_dotfiles.sh sthordall stephan@thordal.io /home/sthordall
      '';
      deps = ["users"];
    };
  };
}
