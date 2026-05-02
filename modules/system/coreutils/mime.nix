{ config, lib, ... }:

let
  cfg = config.systemSettings.mime;

  text = "nvim.desktop";
  image = "feh.desktop";
  video = "mpv.desktop";
  browser = "librewolf.desktop";
in
{
  options = {
    systemSettings.mime = {
      enable = lib.mkEnableOption "Enable mime types";
    };
  };

  config = lib.mkIf cfg.enable {
    xdg.mime = {
      enable = true;
      defaultApplications = {
        "text/plain" = [ text ];

        "image/png" = [ image ];
        "image/jpeg" = [ image ];
        "image/jpg" = [ image ];
        "image/webp" = [ image];

        "video/webm" = [ video ];
        "video/mp4" = [ video ];
        "video/mpv" = [ video ];
        "audio/ogg" = [ video ];
        "audio/mp3" = [ video ];
        "audio/wav" = [ video ];
        "audio/flac" = [ video ];

        "x-scheme-handler/http" = [ browser ];
        "x-scheme-handler/https" = [ browser ];
        "x-scheme-handler/about" = [ browser ];
        "x-scheme-handler/unknown" = [ browser ];
      };
    };
  };
}
