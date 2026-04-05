{ ... }:
{
    services = {
        xserver = {
            enable = true;
            wacom.enable = true;
            xkb.layout = "us";
            videoDrivers = [ "amdgpu" ];
        };
        displayManager.sddm = {
            enable = true;
            autoNumlock = true;
        };
        desktopManager.plasma6.enable = true;
    };
    security.pam.services.sddm.kwallet.enable = false;
}
