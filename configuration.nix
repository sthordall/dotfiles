{ config, pkgs, ... }:

{
  system.stateVersion = "16.09";

  imports =
    [
      # Machine Specific (Choose machine nix file)
      ./nix/machines/workstation-db.nix

      # Common
      ./hardware-configuration.nix
      ./nix/bootloader.nix
      ./nix/desktop.nix
      ./nix/development.nix
      ./nix/fonts.nix
      ./nix/users.nix
    ];

  nixpkgs.config = {
    allowUnfree = true;
    pulseaudio = true;
  };

  i18n = {
    consoleFont = "Lat2-Terminus12";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Copenhagen";

  # Link dotfiles to primary user
  # - Script args: username, email, home_dir
  # - Remember to register user under 'nix/users.nix'
  system.activationScripts = {
    linkDotfiles = {
      text = ''
        export PATH=$PATH:/run/current-system/sw/bin/

        if [ ! -d /home/sthordall/.oh-my-zsh ]
        then
          ln -sf ${pkgs.oh-my-zsh}/share/oh-my-zsh /home/sthordall/.oh-my-zsh
        fi

        if [ ! -d /home/sthordall/.vim/bundle/Vundle.vim ]
        then
          mkdir -p /home/sthordall/.vim/bundle
          git clone https://github.com/VundleVim/Vundle.vim.git \
            /home/sthordall/.vim/bundle/Vundle.vim
        fi

        cd /etc/nixos
        ./link.sh sthordall stephan@thordal.io /home/sthordall /etc/nixos
      '';
      deps = ["users"];
    };
  };
}
