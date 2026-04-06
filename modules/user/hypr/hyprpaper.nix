{config, pkgs, lib, ... }:
  let
   screen = eDP-1;
   img = gothic.jpg;
  in
{
  programs.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = {
        monitor = "${screen}";
        path = "~/Wallpapers/${img}";
        fit_mode = "cover";
      };

      splash = false;
    };
  };
}
