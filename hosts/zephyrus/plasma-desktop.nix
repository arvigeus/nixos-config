{
  pkgs,
  inputs,
  ...
}: {
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm = {
    enable = true;
    enableHidpi = true;
  };
  services.desktopManager.plasma6.enable = true;

  security.pam.services.ssdm.enableKwallet = true;
  security.pam.services.ssdm.gnupg.enable = true;

  # Enable Wayland
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.defaultSession = "plasma";
  programs.dconf.enable = true; # fix theming issues in GTK apps

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Wayland support in Chromium and Electron based applications
    MOZ_USE_XINPUT2 = "1";
  };

  xdg.portal.enable = true;

  environment.systemPackages = with pkgs.kdePackages; [
    kio-admin
    kate
    kget
    kaccounts-integration
    kaccounts-providers
    kio-gdrive
    kimageformats
    qtimageformats # webp preview in Dolphin
    sddm-kcm
    filelight
    kcalc
    kdialog
    kwallet
    kwallet-pam
    kwalletmanager
    kdenlive
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    oxygen
  ];

  programs.gnupg.agent.pinentryPackage = pkgs.pinentry-qt;

  programs.kdeconnect.enable = true;
  programs.partition-manager.enable = true; # KDE Partition Manager

  home-manager.sharedModules = [inputs.plasma-manager.homeManagerModules.plasma-manager];

  home-manager.users.arvigeus.imports = [
    ../../apps/plasma-desktop.nix
  ];
}
