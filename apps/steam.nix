{pkgs, ...}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    package = pkgs.steam.override {
      extraPkgs = pkgs:
        with pkgs; [
          gamescope
          mangohud
          # No idea what these are for
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib
          libkrb5
          keyutils
        ];
    };
  };

  home-manager.users.arvigeus.xdg.desktopEntries = {
    steamBigPicture = {
      name = "Steam (Big Picture Mode)";
      comment = "Application for managing and playing games on Steam (Big Picture Mode)";
      exec = "steam -gamepadui -steamdeck %U";
      terminal = false;
      categories = ["Application"];
      mimeType = [];
    };

    steam = {
      name = "Steam";
      comment = "Application for managing and playing games on Steam";
      exec = "steam -forcedesktopscaling 1.25 %U";
      terminal = false;
      categories = ["Application"];
      mimeType = [];
    };
  };
}
