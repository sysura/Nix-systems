{ config, pkgs, lib, ...}:

let
  cfg = config.systemSettings.flatpak;
in
{
  options = {
    systemSettings.flatpak = {
      enable = lib.mkEnableOption "Enable flatpak service";
    };
  };

  config = lib.mkIf cfg.enable {
    services.flatpak = {
      enable = true;
      package = pkgs.flatpak;
    };
  };
}
