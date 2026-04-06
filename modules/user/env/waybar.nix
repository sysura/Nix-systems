{config, pkgs, lib, ...}:

{
  programs.waybar = {
    enable = true;
    settings = {
        layer = "top";
        height = 37;
        spacing = 5;
        #Choose the order of the modules
        modules-left = ["hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = [
          "tray",
          "power-profiles-daemon",
          "pulseaudio",
          "network",
          "clock",
          "battery",
          "custom/notification",
          "custom/power"
        ];
        "hyprland/window" = {
          separate-outputs = false;
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            urgent = "";
            active = "";
            default = "";
          };
          sort-by-number = true;
          persistent-workspaces = {
            1 = [];
            2 = [];
            3 = [];
          };
        };
        user = {
          format = "{icon} {count}";
          interval = 5;
          height = 23;
          tooltip = true;
          tooltip-format = "{app}: {title}";
        };
        tray = {
          spacing = 10;
        };
        clock = {
          tooltip-format = "{:%A, %B %d, %Y}";
          format = "{:%I:%M}";
          on-click = "calcure";
        };
        network = {
          format-wifi = "{ipaddr}";
          format-ethernet = "";
          format-disconnected = "";
          tooltip-format = "Connected to {essid}";
          tooltip-format-ethernet = "{ifname} ";
        };
        battery = {
              states = {
                  #"good": 95,
                  warning = 30;
                  critical = 15;
              };
              format = "{capacity}% {icon}";
              format-full = "{capacity}% {icon}";
              format-charging = "{capacity}% ";
              format-plugged = "{capacity}% ";
              format-alt = "{time} {icon}";
              # "format-good": "", // An empty format will hide the module
              # "format-full": "",
              format-icons = ["", "", "", "", ""];
        };
        pulseaudio = {
          scroll-step = 5; # %, can be a float
          format = "{icon}";
          format-muted = "";
          format-icons = {
            default = ["", "", ""];
          };
          tooltip-format = "{volume}% volume";
          on-click = "$HOME/.config/scripts/volume --toggle";
          on-scroll-up = "$HOME/.config/scripts/volume --inc";
          on-scroll-down = "$HOME/.config/scripts/volume --dec";
        };
        "custom/power" =  {
          format = "󰐥";
          on-click = "wlogout";
        };
        power-profiles-daemon = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };
        "custom/notification" = {
          tooltip = false;
          format = "{} {icon}";
          "format-icons" = {
            notification = "󱅫";
            none = "";
            dnd-notification = "";
            dnd-none = "󰂛";
            inhibited-notification = "";
            inhibited-none = "";
            dnd-inhibited-notification = "";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "sleep 0.1 && swaync-client -t -sw";
          on-click-right = "sleep 0.1 && swaync-client -d -sw";
          escape = true;
        };
      };
    style = {

    };
  };
}
