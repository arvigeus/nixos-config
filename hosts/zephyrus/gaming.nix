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
    stable.yuzu-mainline
  ];

  imports = [
    ../../apps/steam.nix
    ../../apps/gamemode.nix
    ../../apps/gamescope.nix
  ];
}