{ config, pkgs, lib, ... }:

let
  cfg = config.userSettings.zed;
in
{
  options = {
    userSettings.zed = {
      enable = lib.mkEnableOption "Enable zed editor";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zed-editor = {
      enable = true;
      package = pkgs.zed-editor;
      themes = {
        mode = "dark";
        light = "Ayu Light";
        dark = "Catppuccin Epresso (Blur) [Heavy]";
      };
      userSettings = {
        agent = {
          default_model = {
            provider = "ollama";
	    model = "qwen3.5:latest";
	    enable_thinking = true;
	  };
	  favorite_models = [];
	  model_parameters = [];
        };
        telemetry = {
          diagnostics = false;
	  metrics = false;
        };
        vim_mode = true;
        icon_theme = "Catppuccin Mocha";
        ui_font_size = 16;
        buffer_font_size = 15;
      };
      extensions = [
        "html" "dockerfile" "php" "sql" "nix"
        "catppuccin-icons" "catppuccin-blur"
      ];
    };
  };
}
