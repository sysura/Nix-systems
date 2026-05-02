{ config, lib, pkgs, ...}:

let
  cfg = config.userSettings.lazygit;
in
{
  options = {
    userSettings.lazygit = {
      enable = lib.mkEnableOption "Enable lazygit";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.lazygit = {
      enable = true;
      package = pkgs.lazygit;
      shellWrapperName = "lg";
      enableBashIntegration = true;
      settings = {};
    };
  };
}
