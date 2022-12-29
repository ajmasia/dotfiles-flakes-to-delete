# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Make ready for nix flakes
  nix = {
    # Flakes settings
    package = pkgs.nixVersions.stable;
    registry.nixpkgs.flake = inputs.nixpkgs;

    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  # Bootloader.
  boot.kernel.sysctl."kernel,sysrq" = 1;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.timeout = 1;
  boot.plymouth.enable = true;

  networking.hostName = "drogon"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  services = {
    xserver = {
      # Enable the X11 windowing system.
      enable = true;

      displayManager = {
        # Enable the GNOME Display Manager
        # gdm = {
        #   enable = true;
        # };

        defaultSession = "none+xmonad";
      };

      desktopManager = {
        # Enable the GNOME Desktop Manager
        gnome = {
          enable = true;
        };
      };

      windowManager = {
        # Enable the Xmonad Desktop Manager
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
        };

        # Enable the Bspwm Desktop Manager
        # bspwm = {
        #   enable = true;
        # };
      };

      # Configure keymap in X11
      layout = "us";
      xkbVariant = "altgr-intl";
    };

    udev = {
      packages = with pkgs; [
        gnome.gnome-settings-daemon # Demon needed for gnome app indicator
        pkgs.yubikey-personalization # Needed for yubikey apps
      ];
    };

    # Enable CUPS to print documents.
    printing = {
      enable = true;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;

    };

    # Enable PCSC-Lite daemon, needed to work with yubikey cards
    # Midelware to access a smart card using SCard API (PC/SC)
    pcscd = {
      enable = true;
    }; # Yubikey smart card mode (CCID) and OTP mode (udev)

  };

  # Enable sound with pipewire.
  sound.enable = true;

  hardware = {
    pulseaudio = {
      enable = false;
      package = pkgs.pulseaudioFull;
    };

    bluetooth = {
      enable = true;
      settings = {
        General = {
          ControllerMode = "bredr";
        };
      };
    };
  };

  security.rtkit.enable = true;


  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ajmasia = {
    isNormalUser = true;
    description = "Antonio José Masiá";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  users.extraUsers.ajmasia = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHcSYXvou2J97TsKIHc3BTwZW7ZBcFGX5AVQhFc6yDZ5 antoniojosemasia@gmail.com"
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Terminal tools
    vim
    wget
    ryzenadj

    # Browsers
    firefox

    # GNOME Desktop Manager extensions and tools
    gnomeExtensions.appindicator
    gnomeExtensions.material-shell
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
