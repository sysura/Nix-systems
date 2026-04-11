{ config, lib, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [wireshark];

  # VPNS
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;

  # Tailscale Mesh
  services.tailscale = {
    enable = true;
    # useRoutingFeatures = client;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  programs.wireshark = {
    enable = true;
   #usbmon = true;
   #dumpcap = true;
  };

}
