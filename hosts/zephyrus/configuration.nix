# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  # FIXME: Remove this after migrating to 24.05
  disabledModules = [
    "services/hardware/supergfxd.nix"
    "services/hardware/asusd.nix"
  ];

  imports = with inputs.nixos-hardware.nixosModules; [
    common-cpu-amd-pstate
    common-gpu-amd
    common-pc-ssd
    asus-battery
  ]
  # FIXME: Remove this after migrating to 24.05
  ++ [
    "${inputs.nixpkgs-unstable}/nixos/modules/services/hardware/supergfxd.nix"
    "${inputs.nixpkgs-unstable}/nixos/modules/services/hardware/asusd.nix"
  ];
  
  # Enable networking
  networking.networkmanager.enable = true;
  
  networking.hostName = "zephyrus"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

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

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enables proprietary firmware for enhanced hardware support 
  hardware.enableRedistributableFirmware = true;

  # AMD GPU Configuration
  # hardware.amdgpu.amdvlk = true;
  hardware.amdgpu.opencl = true;
  hardware.amdgpu.loadInInitrd = true;

  # Enables hybrid graphics management and ASUS-specific hardware control.
  # https://asus-linux.org/wiki/nixos/
  services.supergfxd = {
    enable = true;
  };
  services.asusd = {
    enable = true;
    enableUserService = true;
    # FIXME: Remove this after migrating to 24.05
    package = pkgs.unstable.asusctl;
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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # System tools
    git
    wget
    powertop
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

    # Containers
    appimage-run
    
    # Custom packages
    zephyrusctl
  ];

  services.flatpak.enable = true;
  fonts.fontDir.enable = true; # allow Flatpak apps to use system fonts
  
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      corefonts # Microsoft free fonts
      dejavu_fonts
      inconsolata # monospaced
      nerdfonts
      source-code-pro
      source-sans-pro
      source-serif-pro
      ubuntu_font_family
      unifont # some international languages
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "Source Code Pro" ];
        sansSerif = [ "Source Sans Pro" ];
        serif = [ "Source Serif Pro" ];
      };
    };
  };

  # Storage optimization
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}

