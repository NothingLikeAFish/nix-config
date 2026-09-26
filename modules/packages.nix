{ inputs, self, ... }:

{
  flake.modules.nixos.packages = { pkgs, ... }: {
    imports = with self.nixos.modules; [
      packages.cli
      packages.fonts
      packages.browsers

      packages.swayfx
    ];
  };

  flake.modules.nixos.packages.fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      pkgs.nerd-fonts.fira-code
    ];
  };

  flake.modules.nixos.packages.cli = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      git
      micro
      tree
    ];
  };

  flake.modules.nixos.packages.browsers = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      firefox
    ];
  };
}
