{ config, pkgs, lib, ... }:

let
  cfg = config.systemSettings.games;
in
{
  options = {
    systemSettings.games = {
      enable = lib.mkEnableOption "Enable Gaming";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wineWow64Packages.stable
      winetricks
      gamescope
      #steam-run
      #steamtinkerlaunch
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
