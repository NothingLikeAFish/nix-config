{
  flake.nixosModules.services.system = {
    services.printing.enable = true; # Printing support
  };

  flake.nixosModules.services.user = {

  };
}
