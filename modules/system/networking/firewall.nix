{ config, pkgs, lib, ... }:

let
  cfg = config.systemSettings.firewall;
in
{
  options = {
    systemSettings.firewall = {
      enable = lib.mkEnableOption "Enable firewall";
    };
  };

  config = lib.mkIf cfg.enable {
    networking.firewall.enable = true;
    #networking.firewall.allowedTCPPorts = [ ... ];
    #networking.firewall.allowedUDPPorts = [ ... ];
  };
}
