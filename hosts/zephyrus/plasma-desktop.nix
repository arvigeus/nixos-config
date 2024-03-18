{ pkgs, inputs, ... }:

{
  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm = {
    enable = true;
    enableHidpi = true;
  };
  services.xserver.desktopManager.plasma5.enable = true;

  security.pam.services.ssdm.enableKwallet = true;
  security.pam.services.ssdm.gnupg.enable = true;

  # Enable Wayland
  services.xserver.displayManager.sddm.wayland.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";
  programs.dconf.enable = true; # fix theming issues in GTK apps

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Wayland support in Chromium and Electron based applications
    MOZ_USE_XINPUT2 = "1";
  };

  xdg.portal.enable = true;

  environment.systemPackages = with pkgs; [
    pinentry-qt
    icoutils # Display exe icons
  ]
  # KDE
  ++ (with libsForQt5; [
    kate
    kget
    kaccounts-integration
    kaccounts-providers
    kio-gdrive
    sddm-kcm
    filelight
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