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
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    imports = [
      (inputs.import-tree [ ./modules ./wrappers ./wallpapers ])
      inputs.flake-parts.flakeModules.modules
      inputs.wrapper-modules.flakeModules.wrappers
    ];
    systems = [ "x86_64-linux" "aarch64-linux" ];
  };
}
