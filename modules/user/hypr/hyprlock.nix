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
          color = "rgba(25, 20, 20, 1.0)";
          blur_passes = 2;
        };

        label = {
          monitor = "";
          text = "${user} is AFK";
          color = "rgba(199, 200, 200, 1.0)";
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
          inner_color = "rgba(0, 0, 0, 0.0)";
          outer_color = "rgba(89B4FAEE) rgba(B4BEFEEE) 45deg";
          check_color = "rgba(F2CDCDEE) rgba(F5C2E7EE) 120deg";
          fail_color = "rgba(F38BA8EE) rgba(F36BA8) 40deg";
          font_color = "rgba(143, 143, 143)";
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
