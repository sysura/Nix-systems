{config, pkgs, lib, ...}:
  let
    cfg = config.userSettings.wofi;

    flamingo = "#f2cdcd";
    pink = "#f5c2e7";
    mauve = "#cba6f7";
    red = "#f38ba8";
    maroon = "#eba0ac";
    peach = "#fab387";
    yellow = "#f9e2af";
    green = "#a6e3a1";
    teal = "#94e2d5";
    sky = "#89dceb";
    sapphire = "#74c7ec";
    blue = "#89b4fa";
    lavender = "#b4befe";
    text = "#cdd6f4";
    base = "#1e1e2e";
    mantle = "#181825";
    crust = "#11111b";
    white = "#ffffff";
in
{
  options = {
    userSettings.wofi = {
      enable = lib.mkEnableOption "Enable wofi";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.wofi = {
      enable = true;
      package = pkgs.wofi;
      settings = {
        term = "kitty";
        allow_markup = true;
        print_command = false;
        layer = "overlay";
        allow_images = false;
        prompt = "";
        image_size = 30;
        display_generic = false;
        location = "center";
        key_expand = "Tab";
        insensitive = false;
      };

      style = ''
        * {
          font-family: 'CaskaydiaCove Nerd Font', monospace;
          font-size: 13px;
        }

        /* Window */
        window {
          margin: 0px;
          padding: 10px;
          border: 2px solid ${lavender};
          border-radius: 8px;
          background-color: ${crust};
        }

        /* Inner Box */
        #inner-box {
          margin: 5px;
          padding: 10px;
          border: none;
          background-color: ${crust};
        }

        /* Outer Box */
        #outer-box {
          margin: 5px;
          padding: 10px;
          border: none;
          background-color: ${crust};
        }

        /* Scroll */
        #scroll {
          margin: 0px;
          padding: 10px;
          border: none;
          background-color: ${crust};
        }

        /* Input */
        #input {
          margin: 5px 20px;
          padding: 10px;
          border: ${white};
          border-radius: 20px;
          color: ${text};
          background-color: ${crust};
        }

        #input image {
          border: none;
          color: ${white};
        }

        #input * {
          outline: 4px solid ${white}!important;
        }

        /* Text */
        #text {
          margin: 5px;
          border: none;
          color: ${text};
        }

        #entry {
          background-color: ${crust};
        }

        #entry arrow {
          border: none;
          color: ${lavender};
        }

        /* Selected Entry */
        #entry:selected {
          border: 0.11em solid ${lavender};
        }

        #entry:selected #text {
          color: ${mauve};
        }

        #entry:drop(active) {
          background-color: ${crust}!important;
        }
      '';
    };
  };
}
