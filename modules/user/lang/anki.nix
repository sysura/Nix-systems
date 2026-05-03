{ config, lib, pkgs, ...}:

let
  cfg = config.userSettings.anki;
in
{
  options = {
    userSettings.anki = {
      enable = lib.mkEnableOption "Enable Anki SRS";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.anki = {
      enable = true;
      package = pkgs.anki;
      uiScale = 1.0;
      theme = "dark";
      style = "native";
      language = "en_US";
      addons = [];
    };
  };
}
