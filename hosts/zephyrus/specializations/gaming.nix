{
  lib,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.jovian-nixos.nixosModules.default
    inputs.chaotic.nixosModules.default
  ];

  # Use CachyOS' kernel
  # To confirm: `zgrep 'SCHED_CLASS' /proc/config.gz` should return `CONFIG_SCHED_CLASS_EXT=y`
  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  chaotic.scx.enable = true; # by default uses scx_rustland scheduler

  services.displayManager.sddm.enable = lib.mkForce false;

  # Disable services
  virtualisation.podman.enable = lib.mkForce false;
  virtualisation.libvirtd.enable = lib.mkForce false;
  # virtualisation.virtualbox.host.enable = lib.mkForce false;

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
      desktopSession = "plasma";
    };
    decky-loader = {
      # Steam > Settings > System > Enable Developer Mode
      # Steam > Developer > CEF Remote Debugging
      enable = true;
      user = "arvigeus";
    };
  };

  environment.sessionVariables = {
    MANGOHUD = "1"; # Enable for all Vulkan games
  };
}
