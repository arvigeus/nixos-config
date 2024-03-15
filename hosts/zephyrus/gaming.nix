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
  
 programs.gamescope = {
    enable = true;
    package = pkgs.unstable.gamescope;
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    package = pkgs.unstable.steam.override {
      # extraPkgs = with pkgs; [
      #   unstable.gamescope
      #   unstable.mangohud
      # ];
    };
  };

  programs.gamemode.enable = true;
}