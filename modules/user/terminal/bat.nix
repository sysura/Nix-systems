{ config, pkgs, lib, ...}:

let
  cfg = config.userSettings.bat;
in
{
  options = {
    userSettings.bat = {
      enable = lib.mkEnableOption "Enable bat";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.bat = {
      enable = true;
      package = pkgs.bat;
      extraPackages = [];
      syntaxes = {};
      themes = {};
      config = {};
    };
  };
}
