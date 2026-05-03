{ config, pkgs, lib, ... }:

let
  cfg = config.systemSettings.wine;
in
{
  options = {
    systemSettings.wine = {
      enable = lib.mkEnableOption "Enable wine";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wineWow64Packages.stable
      winetricks
    ];
  };
}
