{ inputs, self, ... }:

{
  flake.nixosConfigurations.thinkpad = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [ self.modules.nixos.hosts-thinkpad ./_hardware-configuration.nix ];
  };

  flake.modules.nixos.hosts-thinkpad = { config, pkgs, ... }: {
    imports = with self.modules.nixos; [
      system
      users

      packages
    ];

    networking.hostName = "thinkpad"; # Hostname

    boot.loader.systemd-boot.enable = true; # Bootloader
    boot.loader.efi.canTouchEfiVariables = true;

    boot.kernelPackages = pkgs.linuxPackages_latest; # Kernel

    services.fprintd.enable = true; # Fingerprint reader
    #services.fstrim.enable = true; # SSD fstrim, enabled by default
    #services.libinput.enable = true; # Enable touchpad support (enabled default in most desktopManager).

    system.stateVersion = "26.05";
  };
}
