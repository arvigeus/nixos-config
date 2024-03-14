{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mangohud
    goverlay
    lutris
    heroic
    # wineWowPackages.stable
    wineWowPackages.waylandFull # unstable
    winetricks
    protonup-qt
    protontricks
    yuzu-mainline

    # Misc
    iconv # FIXME: https://github.com/arvigeus/nixos-config/issues/37
  ];

  programs.gamescope.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  programs.gamemode.enable = true;
}