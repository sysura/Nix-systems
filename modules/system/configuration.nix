{
  config,
  lib,
  pkgs,
  ...
}:

let
  WM = "hyprland";
in
{
  config = {
    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
      kernelPackages = pkgs.linuxPackages_latest;
      kernelParams =
        [ ]
        ++ (
          if config.networking.hostName == "ayu" then
            [
              "amdgpu.dcdebugmask=0x10"
            ]
          else
            [ ]
        );
    };

    networking = {
      networkmanager.enable = true;
    };

    time.timeZone = "America/Chicago";

    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
      targets.kmscon.enable = false;
    };

    sops = {
      defaultSopsFile = ../../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";
      age.keyFile = "~/.config/sops/age/keys.txt";
      #secrets = {
      #  example-key = { };
      #  "myservice/my_subdir/my_secret" = { };
      #};
    };

    nixpkgs = {
      overlays = [ ];
    };

    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

    hardware = {
      # Base Graphics
      graphics = {
        enable = true;
      };
    };

    security = {
      rtkit.enable = true;
      pam = {
        services.hyprlock = { };
        services.greetd.enableGnomeKeyring = true;
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
      config.common.default = "*";
    };

    services = {
      # Power
      power-profiles-daemon.enable = true;
      system76-scheduler.enable = true;

      # DM
      displayManager = {
        defaultSession = "${WM}";
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

      dbus.packages = [ pkgs.gcr ];
      tumbler.enable = true;
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    programs = {
      gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };

      # WMs
      hyprland = {
        enable = true;
        withUWSM = false;
      };

      niri = {
        enable = false;
      };

      # Thunar settings
      thunar.enable = true;
      xfconf.enable = true;
    };

    environment.pathsToLink = [
      "/share/xdg-desktop-portal"
      "/share/applications"
    ];

    environment.sessionVariables =
      if config.networking.hostName == "ayu" then
        {
          VDPAU_DRIVER = "radeonsi";
          LIBVA_DRIVER_NAME = "radeonsi";
        }
      else
        { };

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
      nil
      nixd
    ];

    fonts.packages = with pkgs; [
      nerd-fonts.caskaydia-cove
      font-awesome
    ];
  };
}
