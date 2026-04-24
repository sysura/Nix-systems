{ config, pkgs, lib, ... }:

let
  cfg = config.systemSettings.games;
in
{
  options = {
    systemSettings = {
      users = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ];
      };
      games = {
        enable = lib.mkEnableOption "Enable Gaming";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wineWow64Packages.stable
      winetricks
      gamescope
      #steam-run
      #steamtinkerlaunch
      adwsteamgtk
      prismlauncher
      openmw
    ];

    programs.steam = {
      enable = true;
      protontricks.enable = true;
      gamescopeSession.enable = true;
    };
  };
}
