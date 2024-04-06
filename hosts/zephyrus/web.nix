{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Browsers
    google-chrome
    chromium
    microsoft-edge
    tor-browser

    # Messaging
    telegram-desktop
    whatsapp-for-linux
    teams-for-linux
    discord
    thunderbird
  ];

  imports = [
    ../../apps/chromium.nix
  ];

  home-manager.users.arvigeus = {
    imports = [
      ../../apps/firefox.nix
    ];

    xdg.mimeApps = {
      defaultApplications."x-scheme-handler/http" = ["firefox.desktop" "chromium.desktop"];
      defaultApplications."x-scheme-handler/https" = ["firefox.desktop" "chromium.desktop"];
      defaultApplications."text/html" = ["firefox.desktop" "chromium.desktop"];
    };
  };
}
