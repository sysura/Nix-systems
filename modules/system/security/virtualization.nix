{ config, pkgs, lib, ... }:

let
  cfg = config.systemSettings.virtualization;
in
{
  options = {
    systemSettings.virtualization = {
      enable = lib.mkEnableOption "Enable virtualization";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.virt-manager = {
      enable = true;
    };

    virtualisation = {
      libvirtd.enable = true;
      spiceUSBRedirection.enable = true;
    };

    services = {
      qemuGuest.enable = false;
      spice-vdagentd.enable = true;
    };
  };
}
