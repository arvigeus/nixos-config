{ lib, inputs, ... }:

{
  imports = [ inputs.jovian-nixos.nixosModules.default ];
  
  hardware.amdgpu.amdvlk = lib.mkForce false; # Does not work with gamescope
  services.xserver.displayManager.sddm.enable = lib.mkForce false;
  virtualisation.podman.enable = lib.mkForce false;
  services.xserver.desktopManager.kodi.enable = lib.mkForce false;

  services.asusd.profileConfig = "Performance";
  services.supergfxd = {
    enable = true;
    settings = {
      "mode" = "ASUSMUXDGPU";
    };
  };

  jovian = {
    hardware.has.amd.gpu = true;
    steam = {
      enable = true;
      user = "arvigeus";
      autoStart = true;
      desktopSession = "plasmawayland";
    };
    decky-loader = {
      enable = true;
      user = "arvigeus";
    };
  };

  environment.sessionVariables = {
    MANGOHUD = "1"; # Enable for all Vulkan games
  };
}