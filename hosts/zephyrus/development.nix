{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nil
    nixpkgs-fmt
    lapce
    helix
    dotnet-sdk
    nodejs_18
    rustup
    meld
    fira-code
    noto-fonts
    devbox
    distrobox
    bruno
    delta
    diffutils

    # Virtualization
    # podman-desktop

    # Misc
    virt-manager
  ];

  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };
}