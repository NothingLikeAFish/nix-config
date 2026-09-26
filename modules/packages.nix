{ inputs, self, ... }:

{
  flake.modules.nixos.packages = { pkgs, ... }: {
    imports = with self.modules.nixos; [
      packages-cli
      packages-fonts
      packages-browsers

      packages-swayfx
    ];
  };

  flake.modules.nixos.packages-fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];
  };

  flake.modules.nixos.packages-cli = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      git
      micro
      tree
    ];
  };

  flake.modules.nixos.packages-browsers = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      firefox
    ];
  };

  flake.modules.nixos.packages-swayfx = { pkgs, ... }: { # Decide to keep here or move to modules/packages
    programs.sway = { enable = true; package = self.packages.${pkgs.stdenv.hostPlatform.system}.swayfx; };
  };
}
