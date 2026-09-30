{
  description = "my flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    import-tree.url = "github:vic/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dwl-patches = {
      url = "git+https://codeberg.org/dwl/dwl-patches.git";
      flake = false;
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    imports = [
      (inputs.import-tree [ ./modules ./wallpapers ])
      inputs.flake-parts.flakeModules.modules
    ];
  };
}
