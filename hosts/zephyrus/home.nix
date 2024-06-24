{
  inputs,
  outputs,
  ...
}: {
  nixpkgs = {
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
      outputs.overlays.master-packages

      inputs.nix-vscode-extensions.overlays.default
      inputs.nur.overlay
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
    };
  };

  imports = [../../apps/nushell.nix];

  home = {
    username = "arvigeus";
    homeDirectory = "/home/arvigeus";
  };

  xdg.enable = true;
  xdg.mimeApps.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "23.11";
}
