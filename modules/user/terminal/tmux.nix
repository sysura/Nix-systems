{ config, pkgs, lib, ... }:

let
  cfg = config.userSettings.tmux;
in
{
 options = {
   userSettings.tmux = {
     enable = lib.mkEnableOption "Enable tmux multiplexer";
   };
 };

 config = lib.mkIf cfg.enable {
  programs.tmux = {
  enable = true;
     package = pkgs.tmux;
     shortcut = "s";
     mouse = true;
     keyMode = "vi";
     terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      # Handle h,j,k,l pane switching
      vim-tmux-navigator

      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_window_status_style "rounded"

          # Status bar positioning and content
          set -g status-left ""
          set -g status-right "#{E:@catppuccin_status_application} #{E:@catppuccin_status_session}"
          '';
      }
    ];

    extraConfig = ''
      # Terminal Overrides
      set -ag terminal-overrides ",xterm-256color:RGB"

      # UI Tweaks
      set-option -g status-position top
      set -g status-style bg=default

      # Custom Bindings
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"

      # Manual pane navigation (if not using the plugin logic)
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
      '';
    };
  };
}
