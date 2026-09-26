{ inputs, self, ... }:

{
  flake.wrappers.swayfx = { pkgs, lib, wlib, config, ... }: {
    imports = [ wlib.modules.default ];
    package = pkgs.swayfx;
    flags."-c" = config.constructFiles.config.path;
    constructFiles.config = {
      relPath = "config";
      content = ''
        output * bg ${self.wallpaper} fill

        bindsym Mod4+Return exec ${lib.getExe pkgs.foot}
      '';
    };
  };
}
