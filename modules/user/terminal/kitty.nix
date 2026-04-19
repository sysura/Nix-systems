{ config, pkgs, lib, ... }:

let
  cfg = config.userSettings.kitty;
in
{
  options = {
    userSettings.kitty = {
      enable = lib.mkEnableOption "Enable kitty term";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      package = pkgs.kitty;
      settings = {
        font_family = "CaskaydiaCove Nerd Font Mono";
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        font_size = 11;
        background_opacity = 0.9;
      };
      themeFile = "Catppuccin-Mocha";
    };
  };
}
