{ config, inputs, outputs, ... }:

{
  imports = [
    ./plasma-desktop.home.nix
    ./multimedia.home.nix
    ./development.home.nix
  ];

  nixpkgs = {
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      outputs.overlays.master-packages

      inputs.nix-vscode-extensions.overlays.default
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "arvigeus";
    homeDirectory = "/home/arvigeus";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "23.11";
}
