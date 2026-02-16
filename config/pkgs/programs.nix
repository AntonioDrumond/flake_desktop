{ pkgs, ... }:
{
    programs = {
        # Firefox
        firefox.enable = true;

        # Begone satan master of all deceit
        nano.enable = false;

        # Steam
        steam = {
            enable = true;
            remotePlay.openFirewall = true;
            extraCompatPackages = with pkgs; [
                proton-ge-bin
            ];
            # protontricks.enable = true;
        };
    };
}
