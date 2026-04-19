{ config, pkgs, lib, ... }:

let
  cfg = config.userSettings.wlogout;
in
{
  options = {
    userSettings.wlogout = {
      enable = lib.mkEnableOption "Enable wlogout";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.wlogout = {
      enable = true;
      package = pkgs.wlogout;
    };
  };
}
