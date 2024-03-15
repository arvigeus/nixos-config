{ lib, pkgs, ... }:

{
  hardware.amdgpu.amdvlk = lib.mkForce false;
  virtualisation.podman.enable = lib.mkForce false;
  services.xserver.desktopManager.kodi.enable = lib.mkForce false;
  services.xserver.displayManager.defaultSession = lib.mkForce "steam";

  services.asusd.profileConfig = "Performance";
  services.supergfxd = {
    enable = true;
    settings = {
      "mode" = "ASUSMUXDGPU";
    };
  };

  programs.gamescope = {
    enable = true;
    package = pkgs.unstable.gamescope;
  };
  programs.steam = {
    gamescopeSession = {
      enable = true;
      env = {
        WLR_RENDERER = "vulkan";
        DXVK_HDR = "1";
        ENABLE_GAMESCOPE_WSI = "1";
        WINE_FULLSCREEN_FSR = "1";
        # Games allegedly prefer X11
        SDL_VIDEODRIVER = "x11";
      };
      args = [
        "--xwayland-count 2"
        "--expose-wayland"

        "-e" # Enable steam integration
        "--steam"

        "--adaptive-sync"
        "--hdr-enabled"
        "--hdr-itm-enable"

        # External monitor
        "--prefer-output HDMI-A-1"
        "--output-width 2560"
        "--output-height 1440"
        # "-r 75"

        # Laptop display
        # "--prefer-output eDP-1"
        # "--output-width 2560"
        # "--output-height 1600"
        # "-r 120"
        
        "--prefer-vk-device" # lspci -nn | grep VGA
        "1002:73ef" # Dedicated
        # 1002:1681 # Integrated
      ];
    };
  };

  environment.sessionVariables = {
    MANGOHUD = "1"; # Enable for all Vulkan games
  };
}