{ inputs, outputs, ... }:

{
  imports =
    [
      inputs.home-manager.nixosModules.home-manager
    ];

  nix.registry.nixos.flake = inputs.self;
  # home-manager.useGlobalPkgs = true; # Cannot use overlays with this
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "bak";

  security.sudo.wheelNeedsPassword = false;

  users.users.arvigeus = {
    isNormalUser = true;
    description = "Nikolay Stoynov";
    extraGroups = [ "networkmanager" "wheel" "media" ];
    openssh.authorizedKeys.keys = [
      # TODO: Add your SSH public key(s) here
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      arvigeus = import ./home.nix;
    };
  };
}

