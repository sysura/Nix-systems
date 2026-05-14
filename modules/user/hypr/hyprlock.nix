{ config, pkgs, lib, ... }:

  let
    cfg = config.userSettings.hyprlock;

    user = config.home.username;
  in
{
  options = {
    userSettings.hyprlock = {
      enable = lib.mkEnableOption "Enable hyprlock";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.hyprlock = {
      enable = true;
      package = pkgs.hyprlock;
      settings = {
        background = {
          monitor = "";
          path = "/home/${user}/Wallpapers/horse.jpg";
          blur_passes = 2;
        };

        label = {
          monitor = "";
          text = "${user} is AFK";
          font_size = 24;
          font_family = "Noto Sans";
          position = "-1, 80";
          halign = "center";
          valign = "center";
        };

        input-field = {
          monitor = "";
          size = "20%, 5%";
          outline_thickness = 3;
          fade_on_empty = false;
          rounding = 15;
          position = "0, -20";
          halign = "center";
          valign = "center";
        };
      };
    };
  };
}
