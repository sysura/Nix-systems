{ pkgs, ... }:

{
  config = {
    home = {
      packages = with pkgs; [
        networkmanagerapplet
        hyprsunset
        hyprpaper
        pavucontrol
        feh
        mpv
        starship
        trayscale
        gcr
        ripgrep
        peazip
        anki
        bitwarden-desktop
        jellyfin-desktop
        libreoffice
        distrobox
        krita
        jellyfin-tui
        binsider
        bluetui
        wiremix
        brave
        hyprcursor
        openmw
      ];
    };
  };
}
