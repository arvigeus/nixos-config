{...}: {
  specialisation = {
    gaming = {
      inheritParentConfig = true; # Allows for switching to normal desktop
      configuration = {
        system.nixos.tags = ["gaming"];
        imports = [./gaming.nix];
      };
    };
    media = {
      inheritParentConfig = true; # Allows for switching to normal desktop
      configuration = {
        system.nixos.tags = ["media"];
        imports = [./media.nix];
      };
    };
  };
}
