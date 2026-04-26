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
    sevices = {
      openssh.settings = {
        enable = true;
        PermitRootLogin = "no";
      };
    };

    networking.firewall.enable = true;
    networking.firewall.allowedTCPPorts = [ 22 ];
    #networking.firewall.allowedUDPPorts = [ ... ];
  };
}
