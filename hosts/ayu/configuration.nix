{ pkgs, ... }:

{
  config = {
    systemSettings = {
      users = [ "mx" ];

      mime.enable = true;
      bluetooth.enable = true;
      cachy.enable = false;

      steam.enable = true;
      wine.enable = true;
      i18n.enable = true;
      sddm.enable = true;

      flatpak.enable = false;
      firejail.enable = false;
      virtualization.enable = true;

      firewall.enable = true;
      mullvad.enable = true;
      tailscale.enable = true;
      wireshark.enable = true;
    };

    users.users.mx = {
      isNormalUser = true;
      extraGroups = [ "wheel" "libvirtd"];
    };

    users.groups.libvirtd.members = ["mx"];

    environment.systemPackages = with pkgs; [];

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
