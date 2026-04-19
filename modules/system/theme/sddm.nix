{ config, pkgs, lib, ... }:

let
  cfg = config.systemSettings.sddm;
in
{
  options = {
    systemSettings.sddm = {
      enable = lib.mkEnableOption "Enable sddm theme";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [(
      pkgs.catppuccin-sddm.override {
        flavor = "mocha";
        accent = "mauve";
        #font  = "Noto Sans";
        #fontSize = "9";
        #background = "${../../../../Wallpapers/vertigo.png}";
        #loginBackground = true;
      }
    )];
  };
}
