{ inputs, self, ... }:

{
  flake.modules.nixos.users = {
    imports = with self.modules.nixos; [
      users-jasper
    ];
  };

  flake.modules.nixos.users-jasper = { pkgs, ... }: {
    users.users.jasper = {
      isNormalUser = true;
      description = "Jasper";
      extraGroups = [ "networkmanager" "wheel" ];
      initialPassword = "1234";
    };
    home-manager.users.jasper = {
      home.stateVersion = "26.05";
    };
  };
}
