{ config, pkgs, ... }:

{
  fileSystems."/export/media" = {
    device = "/mnt/media";
    options = [ "bind" ];
  };

  fileSystems."/export/backup" = {
    device = "/mnt/backup";
    options = [ "bind" ];
  };

  fileSystems."/export/documents" = {
    device = "/mnt/documents";
    options = [ "bind" ];
  };

  services.nfs.server = {
    enable = true;
    exports = ''
      /export 192.168.1.0/24(insecure,rw,sync,no_subtree_check,crossmnt,fsid=0)
      /export/media 192.168.1.0/24(insecure,rw,sync,no_subtree_check)
      /export/backup 192.168.1.0/24(insecure,rw,sync,no_subtree_check)
      /export/documents 192.168.1.0/24(insecure,rw,sync,no_subtree_check)
    '';
  };

  services.vsftpd = {
    enable = true;
    localUsers = true;
    writeEnable = true;
  };

  services.openssh.allowSFTP = true;
}
