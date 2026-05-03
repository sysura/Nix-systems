{ config, pkgs, lib, ... }:

let
  cfg = config.userSettings.prismlauncher;
in
{
  options = {
    userSettings.prismlauncher = {
      enable = lib.mkEnableOption "Enable prismlauncher";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.prismlauncher = {
      enable = true;
      package = pkgs.prismlauncher;
      extraPackages = [];
      icons = [];
      settings = {
        ShowConsole = true;
        ConsoleMaxLines = 10000;
      };
    };
  };
}
