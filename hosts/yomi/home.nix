{ pkgs, ... }:

{
  config = {
    userSettings = {
      # dev/
      neovim.enable = true;
      obsidian.enable = true;
      zed.enable = true;

      # env/
      mako.enable = true;
      wlogout.enable = true;
      wofi.enable = true;

      # gaming/
      prismlauncher.enable = false;

      # WM
      hyprland.enable = true;
      niri.enable = false;

      # internet/
      qutebrowser.enable = true;
      librewolf.enable = false;
      thunderbird.enable = false;

      # media/
      calibre.enable = true;
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
        ckb-next
        qbittorrent
        jellyfin-desktop
      ];
      sessionVariables = { };
      pointerCursor = {
        package = pkgs.rose-pine-hyprcursor;
        name = "rose-pine-hyprcursor";
        size = 24;
        gtk.enable = true;
        x11.enable = true;
        hyprcursor = {
          enable = true;
          size = 24;
        };
      };
    };

    programs.home-manager.enable = true;
  };
}
