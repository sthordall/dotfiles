{ config, pkgs, ... }:

{
  system.stateVersion = "17.03";

  imports =
    [
      ./hardware-configuration.nix

      # Machine Specific (Uncomment machine nix file)
      #./nix/machines/workstation-db.nix
      #./nix/machines/workstation-home.nix
      #./nix/machines/ananas.nix
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
  system.activationScripts = {
    linkDotfiles = {
      deps = ["users"];
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

        if [ ! -d /home/sthordall/.emacs.d ]
        then
          mkdir -p /home/sthordall/.emacs.d
          git clone https://github.com/syl20bnr/spacemacs \
            /home/sthordall/.emacs.d
        fi
        chown -R sthordall:users /home/sthordall/.emacs.d

        cd /etc/nixos
        ./link.sh sthordall stephan@thordal.io /home/sthordall /etc/nixos
      '';
    };
  };
}
