{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vlc
    gimp-with-plugins
    gimpPlugins.lqrPlugin
    gimpPlugins.gap
    qbittorrent-qt5
    yt-dlp
    lightworks
    mkvtoolnix
    ffmpeg
    subtitleeditor
    audacious
    # FIXME
    # rename-by-metadata
    (callPackage ../../pkgs/rename-by-metadata.nix { })
  ];

  services.xserver.desktopManager.kodi.enable = true;
}

