{ config, pkgs, lib, ... }:

let
  cfg = config.userSettings.hyprshot;
in
{
  options = {
    userSettings.hyprshot = {
      enable = lib.mkEnableOption "Enable hyprshot";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.hyprshot = {
      enable = true;
      package = pkgs.hyprshot;
      saveLocation = "${config.home.homeDirectory}/Pictures/Screenshots";
    };
  };
}
