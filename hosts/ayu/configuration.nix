{ pkgs, ... }:

{
  config = {
    systemSettings = {
      users = [ "mx" ];

      mime.enable = true;
      bluetooth.enable = true;

      games.enable = true;
      i18n.enable = true;
      sddm.enable = true;

      flatpak.enable = false;

      firewall.enable = true;
      mullvad.enable = true;
      qbit.enable = false;
      tailscale.enable = true;
      wireshark.enable = true;
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
