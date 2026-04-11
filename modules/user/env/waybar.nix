{ config, pkgs, lib, ... }:

let
  text = "#cdd6f4";
  base = "#1e1e2e";
  mantle = "#181825";
  crust = "#11111b";
  subtext0 = "#a6adc8";
  subtext1 = "#bac2de";
  surface0 = "#313244";
  surface1 = "#45475a";
  surface2 = "#585b70";
  overlay0 = "#6c7086";
  overlay1 = "#7f849c";
  overlay2 = "#9399b2";
  blue = "#89b4fa";
  white = "#ffffff";
  lavender = "#b4befe";
  sapphire = "#74c7ec";
  sky = "#89dceb";
  teal = "#94e2d5";
  green = "#a6e3a1";
  yellow = "#f9e2af";
  peach = "#fab387";
  maroon = "#eba0ac";
  red = "#f38ba8";
  mauve = "#cba6f7";
  pink = "#f5c2e7";
  flamingo = "#f2cdcd";
  rosewater = "#f5e0dc";

  # Common style
  commonStyle = ''
    padding: 0 6px;
    color: ${text};
    border-radius: 15px;
    margin: 5px 0;
  '';

in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainbar = {
        layer = "top";
       	height = 37;
        spacing = 5;
       	#Choose the order of the modules
     	  modules-left = ["hyprland/workspaces"];
       	modules-center = ["hyprland/window"];
       	modules-right = [
       	  "tray"
      	  "power-profiles-daemon"
      	  "pulseaudio"
          "battery"
      	  "network"
      	  "clock"
      	  "custom/notification"
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
                "1" = "[]";
           	  "2" = "[]";
           	  "3" = "[]";
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
          battery = {
            states = {
              good = 95;
              warning = 30;
              critical = 20;
            };
            format = "{icon} {capacity}%";
            format-charging = " {capacity}%";
            format-plugged = " {capacity}%";
            format-alt = "{time} {icon}";
            format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          };
          network = {
            format-wifi = "{ipaddr}";
            format-ethernet = "";
            format-disconnected = "";
            tooltip-format = "Connected to {essid}";
            tooltip-format-ethernet = "{ifname} ";
          };
          pulseaudio = {
            scroll-step = 5;
            format = "{icon}";
            format-muted = "";
            format-icons = {
              default = ["" "" ""];
            };
            tooltip-format = "{volume}% volume";
            on-click = "$HOME/.config/scripts/volume --toggle";
            on-scroll-up = "$HOME/.config/scripts/volume --inc";
            on-scroll-down = "$HOME/.config/scripts/volume --dec";
          };
          "custom/power" = {
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
            format-icons = {
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
      };

    style = ''
      * {
        font-family: "CaskaydiaCove Nerd Font", monospace;
        font-weight: bolder;
        font-size: 13px;
      }

      window#waybar {
        background-color: transparent;
        color: ${lavender};
        transition-property: all;
        transition-duration: 0.5s;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      button {
        box-shadow: inset 0 -3px transparent;
        border: none;
        border-radius: 0;
      }

      #workspaces button:hover {
        color: ${lavender};
        box-shadow: inherit;
        text-shadow: inherit;
        background: ${crust};
        border: ${crust};
      }

      #workspaces button.empty {
        color: #44475a;
      }

      #workspaces button {
        padding: 0 5px;
        color: ${surface2};
        margin: 4px 0 4px 0;
        transition: color 200ms ease-in-out;
      }

      #workspaces button.selected {
        color: ${flamingo};
      }

      #workspaces button.active {
        color: ${white};
      }

      #workspaces button.urgent {
        color: ${red};
      }

      #clock {
        ${commonStyle}
        color: ${white};
      }
      #battery {
        ${commonStyle}
        color: ${green};
      }
      #cpu { ${commonStyle} }
      #memory { ${commonStyle} }
      #disk { ${commonStyle} }
      #temperature { ${commonStyle} }
      #backlight { ${commonStyle} }
      #network.wifi { ${commonStyle} }
      #network.disconnected {
        ${commonStyle}
        color: ${red};
      }
      #pulseaudio.muted {
        ${commonStyle}
        color: ${red};
      }
      #wireplumber { ${commonStyle} }
      #custom-pacman {
        ${commonStyle}
        color: ${peach};
      }
      #custom-power {
        ${commonStyle}
        color: ${peach};
      }
      #tray { ${commonStyle} }
      #mode { ${commonStyle} }
      #idle_inhibitor { ${commonStyle} }
      #scratchpad {
        ${commonStyle}
        background: rgba(0, 0, 0, 0.2);
      }
      #mpd { ${commonStyle} }

      #power-profiles-daemon.balanced {
        margin-right: 7px;
        color: ${green};
      }

      #power-profiles-daemon.power-saver {
        margin-right: 7px;
        color: ${green};
      }

      #pulseaudio {
        padding: 0 10px;
        color: ${sky};
        border-radius: 15px;
        margin: 5px 0;
      }

      #window { margin: 0 4px; }
      #workspaces { margin: 0 4px; }

      .modules-left>widget:first-child>#workspaces {
        margin-left: 2px;
      }

      #network {
        color: ${lavender};
      }

      #network.ethernet {
        margin: 0 8px 0 0;
      }

      #battery.warning:not(.charging) {
        color: ${red};
      }

      #bluetooth {
        margin-right: 10px;
        font-size: 17px;
        color: white;
      }

      #keyboard-state>label {
        padding: 0 5px;
      }

      #keyboard-state>label.locked {
        background: rgba(0, 0, 0, 0.2);
      }

      #scratchpad.empty {
        background-color: transparent;
      }

      .modules-left {
        background-color: ${crust};
        border-radius: 10px;
        padding-right: 10px;
        margin: 5px 0 0 10px;
      }

      .modules-center {
        background-color: ${crust};
        color: ${white};
        border-radius: 10px;
        padding: 0 20px;
        margin-top: 5px;
      }

      .modules-right {
        background-color: ${crust};
        border-radius: 10px;
        padding: 0 10px;
        margin: 5px 10px 0 0;
      }

      #custom-notification {
        color: white;
        padding-right: 10px;
      }
    '';
  };
}
