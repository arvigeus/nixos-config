{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vlc
    stable.gimp-with-plugins # https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/graphics/gimp/plugins/default.nix
    qbittorrent-qt5
    yt-dlp
    lightworks
    mkvtoolnix
    ffmpeg
    subtitlecomposer
    audacious

    # Custom packages
    rename-by-metadata
  ];

  services.xserver.desktopManager.kodi.enable = true;
}