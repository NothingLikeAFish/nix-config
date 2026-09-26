{
  flake.modules.nixos.services-system = {
    services.printing.enable = true; # Printing support
  };

  flake.modules.nixos.services-user = {

  };
}
