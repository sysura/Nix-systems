{ config, lib, ... }:

let
  cfg = config.systemSettings.mime;

  textEditor = "nvim.desktop";
  imgViewer = "feh.desktop";
  mediaViewer = "mpv.desktop";
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
        "text/plain" = [ textEditor ];
        "image/png" = [ imgViewer ];
        "image/jpeg" = [ imgViewer ];
        "image/jpg" = [ imgViewer ];
        "video/webm" = [ mediaViewer ];
        "video/mp4" = [ mediaViewer ];
        "video/mpv" = [ mediaViewer ];
        "audio/ogg" = [ mediaViewer ];
        "audio/mp3" = [ mediaViewer ];
        "audio/wav" = [ mediaViewer ];
        "audio/flac" = [ mediaViewer ];
      };
    };
  };
}
