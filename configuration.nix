{ config, pkgs, ... }:

{
  system.stateVersion = "18.03";

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

        if [ ! -d /home/sthordall/.vim/autoload ]
        then
          curl -fLo /home/sthordall/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        fi
        chown -R sthordall:users /home/sthordall/.vim

        cd /home/sthordall/Development/github/dotfiles
        ./link.sh sthordall stephan@thordal.io /home/sthordall \
          /home/sthordall/Development/github/dotfiles
      '';
    };
  };
}
