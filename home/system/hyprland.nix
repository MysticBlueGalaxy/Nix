{ pkgs, inputs, ... }:
{
  # ------------------------------------------------
  # Needed Packages
  # ------------------------------------------------

  home.packages = with pkgs; [

    hyprshot
    hyprshade
    hyprpicker

    inputs.hyprsunset.packages."${pkgs.system}".hyprsunset
    inputs.hyprsysteminfo.packages."${pkgs.system}".hyprsysteminfo
    inputs.hyprpolkitagent.packages."${pkgs.system}".hyprpolkitagent

    xdg-desktop-portal-wlr
    xdg-desktop-portal-hyprland

    wev
    wlr-randr
    wdisplays

    gpu-screen-recorder-gtk

    playerctl
    brightnessctl
  ];

  # ------------------------------------------------
  # Hyprland Config
  # ------------------------------------------------

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    # ------------------------------------------------
    # Configuration
    # ------------------------------------------------

    settings = {

      "$mainMod" = "SUPER";

      # App
      "$terminal" = "footclient";
      "$browser" = "firefox";
      "$launcher" = "wofi -S drun -I";
      "$file-manager" = "nautilus";
      "$Tfile-manager" = "$terminal -e yazi";
      "$audio-manager" = "com.saivert.pwvucontrol";
      "$password-manager" = "org.keepassxc.KeePassXC";
      "$bluetooth-manager" = "io.github.kaii_lb.Overskride";

      # ------------------------------------------------
      # Envirronement variables
      # ------------------------------------------------

      env = [

      ];

      # ------------------------------------------------
      # Monitors
      # ------------------------------------------------

      monitor = ",1920x1200@60,auto,1";

      # ------------------------------------------------
      # Sections
      # ------------------------------------------------

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 3;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
      };

      misc = {
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us";
        kb_variant = "";

        follow_mouse = 1;
        accel_profile = "flat";
        sensitivity = 0.4;
        repeat_delay = 300;
        repeat_rate = 50;
        };

      # ------------------------------------------------
      # Keybidings
      # ------------------------------------------------

      bind = [

        # Apps
        "$mainMod, Return, exec, alacritty"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, dolphin"
        "$mainMod, F, togglefloating,"
        "$mainMod, D, exec, wofi "


        # Move focus with mainMod + arrow keys
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"

        # Moving windows
        "$mainMod SHIFT, left,  swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up,    swapwindow, u"
        "$mainMod SHIFT, down,  swapwindow, d"

        # Window resizing                     X  Y
        "$mainMod CTRL, left,  resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive,  60 0"
        "$mainMod CTRL, up,    resizeactive,  0 -60"
        "$mainMod CTRL, down,  resizeactive,  0  60"


        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"


        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Keyboard backlight
        "$mainMod, F3, exec, brightnessctl -d *::kbd_backlight set +33%"
        "$mainMod, F2, exec, brightnessctl -d *::kbd_backlight set 33%-"

        # Volume and Media Control
         ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ -l 1"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"

        ", XF86AudioPlay , exec , playerctl play-pause"
        ", XF86AudioStop , exec , playerctl pause"
        ", XF86AudioPrev , exec , playerctl previous"
        ", XF86AudioNext , exec , playerctl next"

        # Brightness control
        ", XF86MonBrightnessUp,   exec, brightnessctl -q s 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl -q s 5%-"
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];


    };
  };
}
