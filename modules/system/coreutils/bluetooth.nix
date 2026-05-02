{ config, pkgs, lib, ...}:

let
  cfg = config.systemSettings.bluetooth;
in
{
  options = {
    systemSettings.bluetooth = {
      enable = lib.mkEnableOption "Enable bluetooth service";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      blueman
    ];

    hardware = {
      bluetooth = {
        enable = true;
        powerOnBoot = false;
        settings = {
          General = {
            Experimental = true;
          };
        };
      };
    };
  };
}
