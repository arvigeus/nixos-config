{ pkgs, ... }:

{
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

  programs.firefox = {
    enable = true;
    preferences = {
      # Use the native file picker.
      "widget.use-xdg-desktop-portal.file-picker" = 1;
    };
  };

  programs.chromium.enable = true;
}