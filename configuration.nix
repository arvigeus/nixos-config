# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ] ++ (with inputs.nixos-hardware.nixosModules; [
      common-cpu-amd-pstate
      common-gpu-amd
      common-pc-ssd
      asus-battery
    ]);

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.tmp.cleanOnBoot = true;


  boot.kernelParams = [
    "mitigations=off"
  ];

  boot.plymouth.enable = true; # Display loading screen

  boot.initrd.luks.devices."luks-defb6e58-f883-4c98-b933-5d62f344bb9b".device = "/dev/disk/by-uuid/defb6e58-f883-4c98-b933-5d62f344bb9b";
  networking.hostName = "zephyrus"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm = {
    enable = true;
    enableHidpi = true;
  };
  services.xserver.desktopManager.plasma5.enable = true;

  # Enable Wayland
  services.xserver.displayManager.sddm.wayland.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";
  programs.dconf.enable = true; # fix theming issues in GTK apps

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Wayland support in Chromium and Electron based applications
    MOZ_USE_XINPUT2 = "1";
    MANGOHUD = "1"; # Enable for all Vulkan games
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enables proprietary firmware for enhanced hardware support 
  hardware.enableRedistributableFirmware = true;

  # AMD GPU Configuration
  hardware.amdgpu.amdvlk = true;
  hardware.amdgpu.opencl = true;
  hardware.opengl.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];

  # Enables hybrid graphics management and ASUS-specific hardware control.
  # https://asus-linux.org/wiki/nixos/
  services.supergfxd.enable = true;
  services = {
    asusd = {
      enable = true;
      enableUserService = true;
    };
  };

  # Battery
  hardware.asus.battery.chargeUpto = 75;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Support for Logitech Unified Reciever
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.arvigeus = {
    isNormalUser = true;
    description = "Nikolay Stoynov";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kate
      #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "arvigeus";
  security.sudo.wheelNeedsPassword = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # System tools
    git
    wget
    gnumake
    clinfo
    vulkan-tools
    glxinfo
    pciutils
    fwupd
    killall
    neofetch
    p7zip
    unrar
    whois
    libnotify

    # Browsers
    google-chrome
    chromium
    microsoft-edge
    tor-browser

    # Development
    nil
    nixpkgs-fmt
    lapce
    helix
    dotnet-sdk
    nodejs_18
    rustup
    meld
    fira-code

    # Multimedia
    mpv-unwrapped
    vlc
    gimp-with-plugins
    gimpPlugins.lqrPlugin
    gimpPlugins.gap
    qbittorrent-qt5
    yt-dlp
    kodi-wayland
    lightworks
    mkvtoolnix
    subtitleedit

    # Gaming
    mangohud
    lutris
    heroic
    wineWowPackages.stable
    # wineWowPackages.waylandFull # unstable
    winetricks
    protonup-qt
    protontricks

    # Messaging
    telegram-desktop
    whatsapp-for-linux
    teams-for-linux
    discord

    # KDE
    libsForQt5.kget
    libsForQt5.kaccounts-integration
    libsForQt5.kaccounts-providers
    libsForQt5.kio-gdrive
    libsForQt5.sddm-kcm
    libsForQt5.filelight
    libsForQt5.kcalc

    # Containers
    appimage-run

    # Productivity

    # Misc
    virt-manager-qt
    pinentry-qt
  ];

  programs.firefox = {
    enable = true;
    preferences = {
      # Make Firefox use the KDE file picker.
      "widget.use-xdg-desktop-portal.file-picker" = 1;
    };
  };
  programs.chromium.enable = true;

  xdg.portal.enable = true;

  programs.gamescope.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  hardware.steam-hardware.enable = true;

  programs.kdeconnect.enable = true;
  programs.partition-manager.enable = true; # KDE Partition Manager
  services.flatpak.enable = true;

  programs.evolution = {
    enable = true;
  };

  # Storage optimization
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  services.xserver.desktopManager.kodi.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

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
  system.stateVersion = "23.11"; # Did you read the comment?

}

