# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
{pkgs, ...}: {
  # example = pkgs.callPackage ./example { };
  zephyrusctl = pkgs.callPackage ./zephyrusctl.nix { };
  rename-by-metadata = pkgs.callPackage ./rename-by-metadata.nix { };
}
