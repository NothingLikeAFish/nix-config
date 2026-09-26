{ inputs, self, ... }:

{
  flake.nixosModules.packages = { pkgs, ... }: {
    imports = with self.nixosModules; [
      packages.cli
      packages.fonts
      packages.browsers

      packages.swayfx
    ];
  };

  flake.nixosModules.packages-fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
    ];
  };

  flake.nixosModules.packages-cli = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      git
      micro
      tree
    ];
  };

  flake.nixosModules.packages-browsers = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      firefox
    ];
  };
}
