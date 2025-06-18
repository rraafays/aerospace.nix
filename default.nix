{ pkgs, ... }:

{
  services = {
    yabai = {
      enable = true;
    };
    skhd = {
      enable = true;
    };
  };
  environment.systemPackages = [ pkgs.jankyborders pkgs.skhd pkgs.yabai ];
  launchd.daemons = {
    windows = {
      script = ''
        exec ${pkgs.yabai}/bin/yabai
        exec ${pkgs.skhd}/bin/skhd
      '';
      serviceConfig = {
        KeepAlive = true;
        RunAtLoad = true;
      };
    };
    borders = {
      script = ''
        exec ${pkgs.jankyborders}/bin/borders order=above active_color=0xFFFFFFFF inactive_color=0xFF262626 width=3.0
      '';
      serviceConfig = {
        KeepAlive = true;
        RunAtLoad = true;
      };
    };
    wallpaper = {
      script = ''
        exec osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"/System/Library/Desktop Pictures/Solid Colors/Black.png\" as POSIX file"
      '';
      serviceConfig = {
        KeepAlive = true;
        RunAtLoad = true;
      };
    };
  };
}
