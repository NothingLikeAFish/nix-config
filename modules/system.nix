{ inputs, self, ... }:

{
  flake.modules.nixos.system.default = {
    imports = with self.modules; [
      system.nix
      system.audio
      system.locales
      system.networking
    ];
  };

  flake.modules.nixos.system.nix = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enable flakes and other good stuff
    nixpkgs.config.allowUnfree = true; # Allow unfree packages
    nix.optimise = { # Optimise store
      automatic = true;
      dates = "weekly";
    };
    nix.gc = { # Garbage collect
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  flake.modules.nixos.system.audio = {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };

  flake.modules.nixos.system.locales = {
    time.timeZone = "Australia/Sydney"; # Time zone
    i18n.defaultLocale = "en_AU.UTF-8"; # Locales
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_AU.UTF-8";
      LC_IDENTIFICATION = "en_AU.UTF-8";
      LC_MEASUREMENT = "en_AU.UTF-8";
      LC_MONETARY = "en_AU.UTF-8";
      LC_NAME = "en_AU.UTF-8";
      LC_NUMERIC = "en_AU.UTF-8";
      LC_PAPER = "en_AU.UTF-8";
      LC_TELEPHONE = "en_AU.UTF-8";
      LC_TIME = "en_AU.UTF-8";
    };
  };

  flake.modules.nixos.system.networking = {
    networking.networkmanager.enable = true;
    # Add bluetooth
  };
}
