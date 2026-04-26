{ config, lib, pkgs, ... }:

{
  config = {
    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
      kernelPackages = pkgs.linuxPackages_latest;
    };

    networking = {
      networkmanager.enable = true;
    };

    time.timeZone = "America/Chicago";

    #stylix = {
    #  enable = true;
    #  base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    #};

    #sops = {
    #  defaultSopsFile = ../../secrets/secrets.yaml;
    #  defaultSopsFormat = "yaml";
    #  age.keyFile = "~/.config/sops/age/keys.txt";
    #  secrets = {
    #    example-key = { };
    #    "myservice/my_subdir/my_secret" = { };
    #  };
    #};

    hardware = {
      # Base Graphics
      graphics = {
        enable = true;
      };
    };

    security = {
      rtkit.enable = true;
      pam = {
        services.hyprlock = {};
      };
    };

    virtualisation = {
      podman = {
        enable = true;
        dockerCompat = true;
      };
    };

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    };

    services = {
      # Power
      power-profiles-daemon.enable = true;
      system76-scheduler.enable = true;

      # DM
      displayManager = {
        defaultSession = "hyprland";
        sddm = {
          enable = true;
          wayland.enable = true;
          theme = "catppuccin-mocha-mauve";
        };
      };

      # Sound
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
       #jack.enable = true;
      };
      pulseaudio.enable = false;

      # Misc services
      printing.enable = true;

      gvfs.enable = true;
      udisks2.enable = true;
      dbus.enable = true;
      ollama.enable = true;
      syncthing.enable = true;

      udev.packages = with pkgs; [
        yubikey-personalization
      ];

      gnome.gnome-keyring = {
        enable = true;
      };
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    programs = {
      gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };

      hyprland = {
        enable = true;
        withUWSM = false;
      };

      thunar.enable = true;
    };

    environment.systemPackages = with pkgs; [
      wget
      git
      btop
      brightnessctl
      ncdu
      playerctl
      sops
      vim
      catppuccin-sddm
    ];

    fonts.packages = with pkgs; [
      nerd-fonts.caskaydia-cove
      font-awesome
    ];
  };
}
