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
    rename-by-metadata
  ];

  services.xserver.desktopManager.kodi.enable = true;
}

