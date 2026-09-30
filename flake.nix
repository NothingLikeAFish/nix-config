{
  description = "my flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    import-tree.url = "github:vic/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";
    wrapper-modules = {
      url = "github:nix-community/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    imports = [
      (inputs.import-tree [ ./modules ])
      inputs.flake-parts.flakeModules.modules
      inputs.wrapper-modules.flakeModules.wrappers
    ];
  };
}
