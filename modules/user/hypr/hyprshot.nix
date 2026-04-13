{config, pkgs, lib, ...}: 

{
  programs.hyprshot = {
    enable = true;
    package = pkgs.hyprshot;
    saveLocation = "${config.home.homeDirectory}/Pictures/Screenshots";
  };
}
