{ config, pkgs, lib, ... }:
let
  cfg = config.userSettings.fastfetch;

  ascii-img = "hikari-ascii.png";
in
{
  options = {
    userSettings.fastfetch = {
      enable = lib.mkEnableOption "Enable fastfetch";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.fastfetch = {
      enable = true;
      package = pkgs.fastfetch;
      settings = {
        logo = {
          source = "~/Pictures/Ascii/${ascii-img}";
          #width = 0;
          #height = 40;
          padding = {
          right = 1;
        };
      };
      display = {
        separator = ": ";
        color = {
          keys = "light_green";
          title = "light_blue";
        };
        key = {
          width = 12;
          type = "string";
        };
        bar = {
          width = 10;
          "char.Elapsed" = "■";
          "char.Total" = "-";
        };
        percent = {
          type = 9;
          color = {
            green = "green";
            yellow = "light_yellow";
            red = "light_red";
          };
        };
      };
      modules = [
        "title"
        "separator"
        {
          type = "os";
          key = "OS";
          format = "{name} {version}";
        }
        {
          type = "kernel";
          key = "Kernel";
        }
        {
          type = "packages";
          key = "Packages";
          format = "{} (nix)";
        }
        {
          type = "shell";
          key = "Shell";
        }
        {
          type = "terminal";
          key = "Term";
        }
        {
          type = "wm";
          key = "WM";
        }
        {
          type = "uptime";
          key = "Uptime";
        }
        {
          type = "CPU";
          key = "CPU";
        }
        {
          type = "GPU";
          key = "GPU";
        }
        {
          type = "memory";
          key = "Memory";
          percent = {
            type = 3;
            green = 30;
            yellow = 70;
          };
        }
        {
          type = "Disk";
          key = "Disk";
        }
        {
          type = "DiskIO";
          key = "DiskIO";
        }
      ];
    };
  };
  };
}
