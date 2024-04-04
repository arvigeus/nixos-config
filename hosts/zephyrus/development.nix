{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    lapce
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

  home-manager.users.arvigeus.imports = [
    ../../apps/bash.nix
    ../../apps/starship.nix
    ../../apps/vscode.nix
    ../../apps/helix.nix
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

  virtualisation.libvirtd.enable = true;
  users.users.arvigeus.extraGroups = ["libvirtd"];

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["arvigeus"];
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.virtualbox.guest.enable = true;
}
