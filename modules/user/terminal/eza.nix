{ config, pkgs, lib, ...}:

let
  cfg = config.userSettings.eza;
in
{
  options = {
    userSettings.eza = {
      enable = lib.mkEnableOption "Enable eza";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.eza = {
      enable = true;
      package = pkgs.eza;
      git = true;
      icons = "auto";
      colors = "auto";
      enableBashIntegration = true;
      theme = {};
      extraOptions = [];
    };
  };
}
