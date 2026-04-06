{config, pkgs, lib, ...}:

  let
    cfg = config.programs.hyprlock;
  in
{
  programs.hyprlock {
    enable = true;
    description = ''PAM must be active for hyprlock to function'';
    settings = {
      background {
        monitor = ;
        path = /home/$USER/Wallpapers/horse.jpg;
        color = rgba(25, 20, 20, 1.0);
        blur_passes = 2;
      };

      label {
        monitor = ;
        text = $USER is AFK;
        color = rgba(199, 200, 200, 1.0);
        font_size = 24;
        font_family = Noto Sans;
        position = -1, 80;
        halign = center;
        valign = center;
      };

      input-field {
        monitor = ;
        size = 20%, 5%;
        outline_thickness = 3;
        inner_color = rgba(0, 0, 0, 0.0);
        outer_color = rgba(89B4FAEE) rgba(B4BEFEEE) 45deg;
        check_color=rgba(F2CDCDEE) rgba(F5C2E7EE) 120deg;
        fail_color=rgba(F38BA8EE) rgba(F36BA8) 40deg;
        font_color = rgb(143, 143, 143);
        fade_on_empty = false;
        rounding = 15;
        position = 0, -20;
        halign = center;
        valign = center;
      };
    };
  };
}
