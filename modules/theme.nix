{ inputs, self, ... }:

{
  flake.wallpaper = ./wallpapers/swan-pond.jpg;

  flake.colours = builtins.fromJSON (
    builtins.readFile (
      with inputs.nixpkgs.legacyPackages.x86_64-linux;
      runCommand "colours.json"
        {
          nativeBuildInputs = [ flavours yq-go ];
        }
        ''
          flavours generate dark "${self.wallpaper}" --stdout | yq -o=json '.' > "$out"
        ''
    )
  );
}
