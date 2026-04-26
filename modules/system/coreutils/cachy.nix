{ config, pkgs, lib, ...}:

let
  cfg = config.systemSettings.cachy;
in
{
  options = {
    systemSettings.cachy = {
      enable = lib.mkEnableOption "Enable cachy kernel";
      variant = lib.mkOption {
        default = null;
        type = lib.types.nullOr (lib.types.enum ["lto" "lts" "server" "hardened"]);
      };
    };
  };

  config = lib.mkIf cfg.enable {
    boot = {
      kernelPackages = lib.mkMerge [
        (lib.mkIf (cfg.variant == null) pkgs.linuxPackages_cachyos)
        (lib.mkIf (cfg.variant == "lts") pkgs.linuxPackages_cachyos-lts)
        (lib.mkIf (cfg.variant == "lts") pkgs.linuxPackages_cachyos-lto)
        (lib.mkIf (cfg.variant == "lts") pkgs.linuxPackages_cachyos-server)
        (lib.mkIf (cfg.variant == "lts") pkgs.linuxPackages_cachyos-hardened)
      ];
    };
  };
}
