{ config, lib, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    wineWow64Packages.stable
    winetricks
    gamescope
    steam-run
    steamtinkerlaunch
  ];

  programs.steam = {
    enable = true;
    protontricks.enable = true;
    gamescopeSession.enable = true;
  };

}
