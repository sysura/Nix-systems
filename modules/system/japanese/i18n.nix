{ config, pkgs, lib, ... }:

let
  cfg = config.systemSettings.i18n;
in
{
  options = {
    systemSettings.i18n = {
      enable = lib.mkEnableOption "Enable japanese locale and fonts";
    };
  };

  config = lib.mkIf cfg.enable {
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocales = ["ja_JP.UTF-8/UTF-8"];

    fonts.packages = with pkgs; [
      noto-fonts-cjk-sans
    ];
  };
}
