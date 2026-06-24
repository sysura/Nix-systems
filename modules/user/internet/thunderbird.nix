{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.userSettings.thunderbird;
in
{
  options = {
    userSettings.thunderbird = {
      enable = lib.mkEnableOption "Enable thunderbird client";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.thunderbird = {
      enable = true;
      package = pkgs.thunderbird;
    };
  };
}
