{ config, pkgs, lib, ... }:

let
  cfg = config.systemSettings.qbit;
in
{
  options = {
    systemSettings.qbit = {
      enable = lib.mkEnableOption "Enable qbittorrent client";
    };
  };

  config = lib.mkIf cfg.enable {
    services.qbittorrent = {
      enable = true;
      package = pkgs.qbittorrent-nox;
      extraArgs = [ "--confirm-legal-notice" ];
     #user = "qbittorrent";
     #group = "qbittorrent";
    };
  };
}
