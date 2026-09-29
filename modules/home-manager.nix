{ inputs, self, ... }:

{
  flake.modules.nixos.home-manager = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs };
      sharedModules.programs.home-manager.enable = true; # Enable home-manager for every user
    };
  };
}
