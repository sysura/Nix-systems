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

      # japanese/
      anki.enable = false;

      # media/
      freetube.enable = true;

      # shell/
      bash.enable = true;

      # terminal/
      bat.enable = true;
      eza.enable = true;
      fastfetch.enable = true;
      kitty.enable = true;
      lazygit.enable = true;
      tmux.enable = true;
      yazi.enable = true;
    };

    home = {
      username = "mx";
      homeDirectory = "/home/mx";
      stateVersion = "25.11";
      packages = with pkgs; [
        adwsteamgtk
        ckb-next
        qbittorrent
      ];
      sessionVariables = {};
      pointerCursor = {
        package = pkgs.rose-pine-hyprcursor;
        name = "rose-pine-hyprcursor";
        size = 32;
        gtk.enable = true;
        x11.enable = true;
        hyprcursor = {
          enable = true;
          size = 32;
        };
      };
    };

    services = {
      gnome-keyring.enable = true;
    };

    programs.home-manager.enable = true;
  };
}
