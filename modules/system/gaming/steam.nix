{ config, pkgs, lib, ... }:

let
  cfg = config.systemSettings.steam;
in
{
  options = {
    systemSettings.steam = {
      enable = lib.mkEnableOption "Enable Steam";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      package = pkgs.steam;
      extraPackages = with pkgs; [
        gamescope
        protonup-ng
        adwsteamgtk
        #steam-run
        #steamtinkerlaunch
      ];
      protontricks.enable = true;
      gamescopeSession.enable = true;
    };
  };
}
