{config, pkgs, lib, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      background-color = "#1e1e2e";
      text-color = "#cdd6f4";
      border-color = "#b4befe";
      progress-color = "over #313244";
      border-radius = 8;
      text-alignment = "center";
      margin = 10;
      padding = "12,14";
      width = 260;
      height = 80;
      font = "monospace 12";
      max-icon-size = 20;
      default-timeout = 4000;

      "urgency=critical" = {
          default-timeout = 0;
          border-color = "#fab387";
      };
    };
  };
}
