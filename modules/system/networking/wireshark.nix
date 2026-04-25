{ config, pkgs, lib, ... }:

let
  cfg = config.systemSettings.wireshark;
in
{
  options = {
    systemSettings.wireshark = {
      enable = lib.mkEnableOption "Enable wireshark";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.wireshark = {
      enable = true;
     #usbmon = true;
     #dumpcap = true;
    };
  };
}
