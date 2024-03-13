# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ] ++ (with inputs.nixos-hardware.nixosModules; [
      common-cpu-amd-pstate
      common-gpu-amd
      common-pc-ssd
      asus-battery
    ]);

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enables proprietary firmware for enhanced hardware support 
  hardware.enableRedistributableFirmware = true;

  # AMD GPU Configuration
  hardware.amdgpu.amdvlk = true;
  hardware.amdgpu.opencl = true;
  hardware.amdgpu.loadInInitrd = true;

  # Enables hybrid graphics management and ASUS-specific hardware control.
  # https://asus-linux.org/wiki/nixos/
  services.supergfxd.enable = true;
  services = {
    asusd = {
      enable = true;
      enableUserService = true;
    };
  };

  # Battery
  hardware.asus.battery.chargeUpto = 75;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Support for Logitech Unified Reciever
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    zephyrusctl
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}

