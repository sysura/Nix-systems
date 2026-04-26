{ pkgs, ... }:

{
  config = {
    userSettings = {
      neovim.enable = true;
      obsidian.enable = true;
      zed.enable = true;

      # env/
      mako.enable = true;
      waybar.enable = true;
      wlogout.enable = true;
      wofi.enable = true;

      # hypr/
      hyprland.enable = true;
      hyprlock.enable = true;
      hyprpaper.enable = true;
      hyprshot.enable = true;

      # internet /
      qutebrowser.enable = true;
      librewolf.enable = true;

      # media/
      freetube.enable = true;

      # shell/
      bash.enable = true;

      # terminal/
      fastfetch.enable = true;
      kitty.enable = true;
      tmux.enable = true;
      yazi.enable = true; 
    };

    home = {
      username = "mx";
      homeDirectory = "/home/mx";
      stateVersion = "25.11";
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
      ];
      sessionVariables = {};
    };

    services = {
      gnome-keyring.enable = true;
    };

    programs.home-manager.enable = true;
  };
}
