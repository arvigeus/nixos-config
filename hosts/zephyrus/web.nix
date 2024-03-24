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

  home-manager.users.arvigeus.imports = [
    ../../apps/firefox.nix
    ../../apps/chromium.nix
  ];
}