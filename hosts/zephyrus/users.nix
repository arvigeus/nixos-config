{
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  security.sudo.wheelNeedsPassword = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.arvigeus = {
    isNormalUser = true;
    description = "Nikolay Stoynov";
    extraGroups = ["networkmanager" "wheel" "media" "video"];
    openssh.authorizedKeys.keys = [
      # TODO: Add your SSH public key(s) here
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "arvigeus";

  # home-manager.useGlobalPkgs = true; # Cannot use overlays with this
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "bak";

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    users = {
      # Import your home-manager configuration
      arvigeus = import ./home.nix;
    };
  };
}
