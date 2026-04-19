{ config, lib, pkgs, ... }:
let
  cfg = config.userSettings.yazi;
in
{
  options = {
    userSettings.yazi = {
      enable = lib.mkEnableOption "Enable yazi file manager";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      package = pkgs.yazi;
      shellWrapperName = "y";
      enableBashIntegration = true;
      settings = {
        log = {
          enabled = false;
        };
        manager = {
          show_hidden = true;
          sort_by = "modified";
          sort_dir_first = true;
          sort_reverse = true;
        };
        filetype = {
          rules = [
            {
              #fg = "";
              mime = "image/*";
            }
            {
              #fg = "";
              mime = "video/*";
            }
            {
              #fg = "";
              mime = "audio/*";
            }
          ];
          previewers = [
            {
              mime = "text/*";
              exec = "nvim";
            }
            {
              mime = "*/xml";
              exec = "nvim";
            }
            {
              mime = "*/yaml";
              exec = "nvim";
            }
            {
              mime = "*/javascript";
              exec = "nvim";
            }
            {
              mime = "*/x-wine-extension-ini";
              exec = "nvim";
            }
            {
              mime = "*/tf";
              exec = "nvim";
            }
            {
              mime = "application/json";
              exec = "nvim";
            }
            {
              mime = "image/*";
              exec = "feh";
            }
            {
              mime = "video/*";
              exec = "mpv";
            }
          ];
        };
      };
    };
  };
}
