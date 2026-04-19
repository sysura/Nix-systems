{ config, pkgs, lib, ... }:
let
  cfg = config.systemSettings.networking;
in
{
  options = {
    systemSettings.networking = {
      enable = lib.mkEnableOption "Enable networking";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [wireshark];

    # VPNS
    services.mullvad-vpn.enable = true;
    services.mullvad-vpn.package = pkgs.mullvad-vpn;

    # Tailscale Mesh
    services.tailscale = {
      enable = true;
      # useRoutingFeatures = client;
    };

    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # networking.firewall.enable = false;

    programs.wireshark = {
      enable = true;
      #usbmon = true;
      #dumpcap = true;
    };
  };
}
