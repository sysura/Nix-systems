{ pkgs, ... }:

{
  config = {
    systemSettings = {
      users = [ "mx" ];

      mime.enable = false;

      games.enable = false;
      i18n.enable = false;
      sddm.enable = false;

      firewall.enable = false;
      mullvad.enable = false;
      qbit.enable = false;
      tailscale.enable = false;
      wireshark.enable = false;
    };

    users.users.mx = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };

    environment.systemPackages = with pkgs; [
      talosctl
      kubectl
      signal-desktop
      protonmail-bridge
    ];

    services = {
      logind = {
        settings.Login = {
          HandleLidSwitch = "suspend";
          HandleLidSwitchExternalPower = "lock";
          HandleLidSwitchDocked = "ignore";
        };
      };
    };

    system.stateVersion = "25.11";

    nix.settings.experimental-features = ["nix-command" "flakes"];
  };
}
