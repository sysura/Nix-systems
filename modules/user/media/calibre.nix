{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.userSettings.calibre;
in
{
  options = {
    userSettings.calibre = {
      enable = lib.mkEnableOption "Enable calibre reader";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.calibre = {
      enable = true;
      package = pkgs.calibre;
      plugins = [ ];
    };
  };
}
