{ ... }:

{
  specialisation = {
    gaming = {
      inheritParentConfig = true; # FIXME
      configuration = {
        system.nixos.tags = [ "gaming" ];
        imports = [ ./gaming.nix ];
      };
    };
  };
}

