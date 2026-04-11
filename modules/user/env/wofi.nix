{config, pkgs, lib, ...}:
  let
    rosewater-rgb = "rgb(245, 224, 220)";
    flamingo = "#f2cdcd";
    flamingo-rgb = "rgb(242, 205, 205)";
    pink = "#f5c2e7";
    pink-rgb = "rgb(245, 194, 231)";
    mauve = "#cba6f7";
    mauve-rgb = "rgb(203, 166, 247)";
    red = "#f38ba8";
    red-rgb = "rgb(243, 139, 168)";
    maroon = "#eba0ac";
    maroon-rgb = "rgb(235, 160, 172)";
    peach = "#fab387";
    peach-rgb = "rgb(250, 179, 135)";
    yellow = "#f9e2af";
    yellow-rgb = "rgb(249, 226, 175)";
    green = "#a6e3a1";
    green-rgb = "rgb(166, 227, 161)";
    teal = "#94e2d5";
    teal-rgb = "rgb(148, 226, 213)";
    sky = "#89dceb";
    sky-rgb = "rgb(137, 220, 235)";
    sapphire = "#74c7ec";
    sapphire-rgb = "rgb(116, 199, 236)";
    blue = "#89b4fa";
    blue-rgb = "rgb(137, 180, 250)";
    lavender = "#b4befe";
    lavender-rgb = "rgb(180, 190, 254)";
    text = "#cdd6f4";
    text-rgb = "rgb(205, 214, 244)";
    subtext1 = "#bac2de";
    subtext1-rgb = "rgb(186, 194, 222)";
    subtext0 = "#a6adc8";
    subtext0-rgb = "rgb(166, 173, 200)";
    overlay2 = "#9399b2";
    overlay2-rgb = "rgb(147, 153, 178)";
    overlay1 = "#7f849c";
    overlay1-rgb = "rgb(127, 132, 156)";
    overlay0 = "#6c7086";
    overlay0-rgb = "rgb(108, 112, 134)";
    surface2 = "#585b70";
    surface2-rgb = "rgb(88, 91, 112)";
    surface1 =  "#45475a";
    surface1-rgb = "rgb(69, 71, 90)";
    surface0 = "#313244";
    surface0-rgb = "rgb(49, 50, 68)";
    base = "#1e1e2e";
    base-rgb = "rgb(30, 30, 46)";
    mantle = "#181825";
    mantle-rgb = "rgb(24, 24, 37)";
    crust = "#11111b";
    crust-rgb = "rgb(17, 17, 27)";
    white = "#ffffff";
in
{
  programs.wofi = {
    enable = true;
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
}
