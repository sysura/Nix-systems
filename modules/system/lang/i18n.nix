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
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
    i18n.extraLocales = ["ja_JP.UTF-8/UTF-8"];

    fonts.packages = with pkgs; [
      noto-fonts-cjk-sans
    ];
  };
}
