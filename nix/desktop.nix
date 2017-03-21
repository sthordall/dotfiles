{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Web
    chromium

    # Terminal
    rxvt_unicode

    # Xfce 4
    xfce.xfce4_cpufreq_plugin
    xfce.xfce4_systemload_plugin
    xfce.xfce4_xkb_plugin
    xfce.xfce4_embed_plugin
    xfce.xfce4_battery_plugin
    xfce.xfce4_verve_plugin
    xfce.xfce4_clipman_plugin
    xfce.xfce4_datetime_plugin
    xfce.xfce4_netload_plugin
    xfce.gigolo
    xfce.xfce4taskmanager

  ];

  services.xserver = {
    enable = true;
    layout = "us";
    displayManager.lightdm.enable = true;
    desktopManager.xfce = {
      enable = true;
      thunarPlugins = with pkgs.xfce; [
        thunar-archive-plugin thunar_volman
      ];
    };
  };
}
