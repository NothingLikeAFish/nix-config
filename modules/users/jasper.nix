{ inputs, self, ... }:

{
  flake.modules.nixos.users.jasper = { pkgs, ... }: {
    users.users.jasper = {
      isNormalUser = true;
      description = "Jasper";
      extraGroups = [ "networkmanager" "wheel" ];
      initialPassword = "1234";
    };
  };
}
