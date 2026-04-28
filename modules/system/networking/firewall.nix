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
    services = {
      openssh.enable = true;
      openssh.settings = {
        PermitRootLogin = "no";
	PasswordAuthentication = true;
      };
    };

    networking.firewall.enable = true;
    networking.firewall.allowedTCPPorts = [ 22 ];
    #networking.firewall.allowedUDPPorts = [ ... ];
  };
}
