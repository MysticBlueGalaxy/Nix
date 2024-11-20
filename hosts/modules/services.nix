{
  services = {  
    # Enable CUPS to print documents.
    printing.enable = true;
    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm.enable = true;
#    desktopManager.plasma6.enable = true;
    xserver = {
      # Enable the X11 windowing system.
      # You can disable this if you're only using the Wayland session.
      enable = true;
       # Configure keymap in X11
      xkb = {
        layout = "pl";
        variant = "";
      };
      # videoDrivers = [ "nvidia" ];

     # Enable touchpad support (enabled default in most desktopManager).
     # libinput.enable = true;
    };
    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;
  };
}
