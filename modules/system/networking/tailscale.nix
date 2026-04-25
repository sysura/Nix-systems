{config, pkgs, lib, ... }:

let
  cfg = config.systemSettings.tailscale;
in
{
  options = {
    systemSettings.tailscale = {
      enable = lib.mkEnableOption "Enable tailscale VPN";
    };
  };

  config = lib.mkIf cfg.enable {
    services.tailscale = {
      enable = true;
      package = pkgs.tailscale;
     #useRoutingFeatures = client;
    };
  };
}
