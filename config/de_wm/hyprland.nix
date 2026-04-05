{ lib, pkgs, ... }:
{
    programs = {
        hyprland = {
            enable = true;
            xwayland.enable = true;
        };
        # hyprlock.enable = true;
        # waybar.enable = true;
    };
    services = {
        hypridle.enable = false;
    };
}
