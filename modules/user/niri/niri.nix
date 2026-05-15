{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

let
  cfg = config.userSettings.niri;
in
{
  imports = [
    inputs.niri.homeModules.niri
  ];

  options = {
    userSettings.niri = {
      enable = lib.mkEnableOption "Enable niri wm";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.niri = {
      enable = true;
      package = pkgs.niri;
    };
  };
}
