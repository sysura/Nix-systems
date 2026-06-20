{ config, pkgs, ... }:

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
        hyprpolkitagent
        kdePackages.kleopatra
        mullvad-browser
        exiftool
      ];
    };

    services.hyprpolkitagent.enable = true;

    gtk = {
      enable = true;
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.catppuccin-papirus-folders.override {
          flavor = "mocha";
          accent = "lavender";
        };
      };
      #gtk4.theme = config.gtk.theme;
    };
  };
}
