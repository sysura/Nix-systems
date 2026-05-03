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
        bitwarden-desktop
        jellyfin-desktop
        libreoffice
        anki
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
