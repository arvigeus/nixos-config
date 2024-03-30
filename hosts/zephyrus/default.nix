{outputs, ...}: {
  imports = [
    ./boot.nix
    ./configuration.nix
    ./hardware-configuration.nix
    ./users.nix
    ./plasma-desktop.nix
    ./multimedia.nix
    ./web.nix
    ./gaming.nix
    ./development.nix
    ./specializations
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
      outputs.overlays.master-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
  };
}
