{ pkg, config, ... }:
{
  services = {
    xserver = {
      enable = true;
      displayManager = {
        gdm.enable = true;
      };
      desktopManager = {
        gnome.enable = true;
      };
    };
  };
  environment.gnome.excludePackages =
    with pkgs;
    [
      gnome-photos
      gnome-tour
    ]
    ++ (with pkgs.gnome; [
      cheese
      gnome-music
      epiphany
      geary
      evince
      totem
      gnome-contacts
      gnome-maps
      gnome-weather
      simple-scan
      yelp
    ]);
  environment.systemPackages = [ pkgs.gnome-tweaks ];
}
