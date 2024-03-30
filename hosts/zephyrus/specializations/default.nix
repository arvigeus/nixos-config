{...}: {
  specialisation = {
    gaming = {
      inheritParentConfig = true; # Allows for switching to normal desktop
      configuration = {
        system.nixos.tags = ["gaming"];
        imports = [./gaming.nix];
      };
    };
  };
}
