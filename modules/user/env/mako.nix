{config, pkgs, lib, ... }:
let
  cfg = config.userSettings.mako;
  bgCol = "#1e1e2e";
  textCol = "#cdd6f4";
  borderColor = "#b4befe";
  progColor = "#313244";
  critBorderColor = "fab387";
in
{
  options = {
    userSettings.mako = {
      enable = lib.mkEnableOption "Enable mako notifications";
    };
  };

  config = lib.mkIf cfg.enable {
    services.mako = {
      enable = true;
      package = pkgs.mako;
      settings = {
        background-color = "${bgCol}";
        text-color = "${textCol}";
        border-color = "${borderColor}";
        progress-color = "over ${progColor}";
        border-radius = 8;
        text-alignment = "center";
        margin = 10;
        padding = "12,14";
        width = 300;
        height = 100;
        font = "monospace 10";
        max-icon-size = 20;
        default-timeout = 4000;

        "urgency=critical" = {
            default-timeout = 0;
            border-color = "${critBorderColor}";
        };
      };
    };
  };
}
