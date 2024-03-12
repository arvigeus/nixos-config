{ pkgs, inputs, ... }:

{
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
  xdg.portal.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Wayland support in Chromium and Electron based applications
    MOZ_USE_XINPUT2 = "1";
    # MANGOHUD = "1"; # Enable for all Vulkan games
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "arvigeus";
  security.pam.services.ssdm.enableKwallet = true;
  security.pam.services.ssdm.gnupg.enable = true;

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

    # Misc
    pinentry-qt
    icoutils # Display exe icons
  ]
  # KDE
  ++ (with libsForQt5; [
    kget
    kaccounts-integration
    kaccounts-providers
    kio-gdrive
    sddm-kcm
    filelight
    kate
    kcalc
    kdialog
    kwallet
    kwallet-pam
    kwalletmanager
    kdenlive
  ]);

  programs.kdeconnect.enable = true;
  programs.partition-manager.enable = true; # KDE Partition Manager

  home-manager.sharedModules = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];
}

