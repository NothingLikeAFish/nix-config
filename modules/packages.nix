{ { inputs, self, ... }:

{
  flake.modules.nixos.packages = { pkgs, ... }: {
    imports = with self.modules.nixos; [
      packages-cli
      packages-fonts
      packages-browsers
      packages-coding

      packages-swayfx
      packages-waybar
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
      fastfetch
    ];
  };

  flake.modules.nixos.packages-browsers = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      firefox
    ];
  };

  flake.modules.nixos.packages-coding = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      zed-editor
    ];
  };
}
