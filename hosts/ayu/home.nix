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
      waybar.enable = true;
      wlogout.enable = true;
      wofi.enable = true;

      # gaming/
      prismlauncher.enable = true;

      # hypr/
      hyprland.enable = true;
      hyprlock.enable = true;
      hyprpaper.enable = true;
      hyprshot.enable = true;

      # internet/
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
          talosctl
          kubectl
          signal-desktop
          protonmail-bridge
        ];
        sessionVariables = {};
     };

    programs.home-manager.enable = true;
  };
}
