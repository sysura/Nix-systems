{ config, pkgs, lib, ... }:
  let
   cfg = config.userSettings.hyprpaper;

   screen = "eDP-1";
   img = "gothic.jpg";
  in
{
  options = {
    userSettings.hyprpaper = {
      enable = lib.mkEnableOption "Enable hyprpaper";
    };
  };

  config = lib.mkIf cfg.enable {
    services.hyprpaper = {
      enable = true;
      package = pkgs.hyprpaper;
      settings = {
        wallpaper = {
          monitor = "${screen}";
          path = "~/Wallpapers/${img}";
          fit_mode = "cover";
        };

        splash = false;
      };
    };
  };
}
