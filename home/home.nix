{ host, ... }:
{
  imports =
    if host == "cubic" then
      [
        # programs
        # ./programs/git.nix
#        ./programs/btop.nix
#        ./programs/yazi.nix
#        ./programs/foot.nix
#        ./programs/shell.nix
#        ./programs/helix.nix
#        ./programs/bottom.nix
#        ./programs/zathura.nix
#        ./programs/packages.nix
#        ./programs/freetube.nix
#        ./programs/vscodium.nix
#        ./programs/spicetify.nix
#        ./programs/fastfetch.nix
#        ./programs/firefox.nix

        # system
#        ./system/tofi.nix
        ./system/wofi.nix
#        ./system/dunst.nix
#        ./system/stylix.nix
#        ./system/waybar.nix
#        ./system/wlsunset.nix
        ./system/hyprland.nix
      ]
    else if host == "server" then
      [





      ]
    else [ ];
}
