{ config, pkgs, lib, ... }:

let
  cfg = config.systemSettings.fcitx5;
in
{
  options = {
    systemSettings.fcitx5 = {
      enable = lib.mkEnableOption "Enable fcitx5 and mozc";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.variables = {
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
    };

    i18n.inputMethod = {
      enabled = "fcitx5";
      type = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
      ];
    };
  };
}
