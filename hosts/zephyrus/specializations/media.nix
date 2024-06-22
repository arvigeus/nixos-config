{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.nixarr.nixosModules.default
  ];

  services.displayManager.sddm.wayland.enable = lib.mkForce false;
  services.desktopManager.plasma6.enable = lib.mkForce false;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-kde];

  services.xserver.enable = true;
  services.xserver.desktopManager.kodi = {
    enable = true;
    package = pkgs.kodi.withPackages (kodiPkgs:
      with kodiPkgs; [
        # package = pkgs.kodi-wayland.passthru.withPackages (kodiPkgs: with kodiPkgs; [
        kodi-platform # Includes HDMI CEC support
        a4ksubtitles

        ## Streaming
        youtube
        netflix
        sponsorblock
        # jellyfin # NOTE: https://jellyfin.org/docs/general/clients/kodi/

        ## Gaming: https://kodi.wiki/view/Game_add-ons
        # joystick
        # steam-controller
        # libretro
        # libretro-nestopia # Nintendo NES / Famicom

        ## Other
        pdfreader
      ]);
  };
  services.displayManager.defaultSession = lib.mkForce "kodi";

  # https://kodi.wiki/view/Webserver
  networking.firewall = {
    allowedTCPPorts = [8080];
    allowedUDPPorts = [8080];
  };

  nixarr = {
    enable = true;
    # WARNING: Do _not_ set them to `/home/user/whatever`, it will not work!
    mediaDir = "/data/media";
    stateDir = "/data/media/.state/nixarr";

    mediaUsers = ["arvigeus"];

    jellyfin = {
      enable = true;
      openFirewall = true;
      # These options set up a nginx HTTPS reverse proxy, so you can access
      # Jellyfin on your domain with HTTPS
      # expose.https = {
      #   enable = true;
      #   domainName = "your.domain.com";
      #   acmeMail = "your@email.com"; # Required for ACME-bot
      # };
    };

    transmission = {
      enable = true;
      openFirewall = true;
      # vpn.enable = true;
      # peerPort = 50000; # Set this to the port forwarded by your VPN
    };

    # It is possible for this module to run the *Arrs through a VPN, but it
    # is generally not recommended, as it can cause rate-limiting issues.
    bazarr = {
      enable = true;
      openFirewall = true;
    };
    lidarr = {
      enable = true;
      openFirewall = true;
    };
    prowlarr = {
      enable = true;
      openFirewall = true;
    };
    radarr = {
      enable = true;
      openFirewall = true;
    };
    readarr = {
      enable = true;
      openFirewall = true;
    };
    sonarr = {
      enable = true;
      openFirewall = true;
    };
  };

  services.jellyseerr = {
    enable = true;
    openFirewall = true;
  };
}
