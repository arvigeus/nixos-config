{ ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./boot.nix
      ./configuration.nix
      ./networking.nix
      ./sound.nix
      ./localization.nix
      ./fonts.nix
      ./users.nix
      ./desktop.nix
      ./web.nix
      ./development.nix
      ./multimedia.nix
      ./gaming.nix
      ./virtualization.nix
      ./system.nix
    ];
}

