{ pkgs, ... }:

{
  config = {
    systemSettings = {
      users = [ "mx" ];

      mime.enable = true;
      bluetooth.enable = false;
      cachy.enable = false;

      steam.enable = true;
      wine.enable = true;
      fcitx5.enable = true;
      i18n.enable = true;
      sddm.enable = true;

      flatpak.enable = true;
      firejail.enable = true;
      virtualization.enable = true;

      firewall.enable = true;
      mullvad.enable = true;
      tailscale.enable = true;
      wireshark.enable = false;
    };

    users.users.mx = {
      isNormalUser = true;
      extraGroups = [ "wheel" "libvirtd"];
    };

    users.groups.libvirtd.members = ["mx"];

    environment.systemPackages = with pkgs; [];

    services = {
      xserver.videoDrivers = ["nvidia"];
    };

    hardware = {
      nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
      };
    };

    fileSystems."/mnt/hdd1" = {
      device = "/dev/disk/by-uuid/fa0a8dcf-381b-47be-971b-1ac242ef3cab";
      fsType = "ext4";
      options = [ "nofail" ];
    };

    fileSystems."/mnt/sdd" = {
      device = "/dev/disk/by-uuid/709d2aee-054d-4cc5-a979-74ea4d05cff9";
      fsType = "ext4";
      options = [ "nofail" ];
    };

    fileSystems."/mnt/nvme2" = {
      device = "/dev/disk/by-uuid/b4c58fe6-2f9e-4fd6-8e19-f7c48a8bc5d4";
      fsType = "ext4";
      options = [ "nofail" ];
    };

    system.stateVersion = "25.11";

    nix.settings.experimental-features = ["nix-command" "flakes"];
  };
}
