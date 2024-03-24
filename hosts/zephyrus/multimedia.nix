{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vlc
    stable.gimp-with-plugins # https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/graphics/gimp/plugins/default.nix
    qbittorrent-qt5
    lightworks
    davinci-resolve
    mkvtoolnix
    ffmpeg
    subtitlecomposer
    audacious

    # Custom packages
    rename-by-metadata
  ];

  home-manager.users.arvigeus.imports = [
    ../../apps/mpv.nix
    ../../apps/yt-dlp.nix
  ];

  services.xserver.desktopManager.kodi.enable = true;
}