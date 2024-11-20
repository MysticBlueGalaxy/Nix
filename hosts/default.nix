{ host, config, ... }:
{
  imports =
    if host == "cubic" then [
      ./cubic.nix

      # ./modules/adb.nix
      # ./modules/ananicy.nix
      ./modules/bundle.nix
      # ./modules/bluetooth.nix
#      ./modules/boot.nix
      ./modules/configuration.nix
#      ./modules/fstrim.nix
      # ./modules/gaming.nix
#      ./modules/greetd.nix
#      ./modules/gsettings.nix
      # ./modules/kde.nix
      # ./modules/lanzaboot.nix
#      ./modules/network.nix
#      ./modules/nh.nix
#      ./modules/nvidia.nix
      # ./modules/ollama.nix
#      ./modules/packages.nix
#      ./modules/pipewire.nix
#      ./modules/printing.nix
      # ./modules/qtile.nix
#      ./modules/security.nix
      # ./modules/ssh.nix
      # ./modules/thunar.nix
#      ./modules/time.nix
      # ./modules/tlp.nix
#      ./modules/users.nix
#      ./modules/vm.nix
      # ./modules/xserver.nix
    ]
    else if host == "server" then [
      ./server.nix





    ]
    else [ ];
}
