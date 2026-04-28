{ config, pkgs, lib, ... }:

let
  cfg = config.systemSettings.firejail;
in
{
  options = {
    systemSettings.firejail = {
      enable = lib.mkEnableOption "Enable firejail sandboxing";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.firejail = {
      enable = true;
      wrappedBinaries = {};
    };
  };
}
