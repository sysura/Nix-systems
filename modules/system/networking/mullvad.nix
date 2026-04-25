{ config, pkgs, lib, ... }:

let
  cfg = config.systemSettings.mullvad;
in
{
  options = {
    systemSettings.mullvad = {
      enable = lib.mkEnableOption "Enable mullvad VPN";
    };
  };

  config = lib.mkIf cfg.enable {
    services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
      enableEarlyBootBlocking = false;
    };
  };
}
