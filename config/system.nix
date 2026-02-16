{ pkgs, ... }:
{
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    systemd.tmpfiles.rules = [
        "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];

    services = {
        printing.enable = true;
    };

    environment.sessionVariables = {
        # NIXOS_OZONE_WL = "1";
        GDK_BACKEND = "wayland,x11";
        GDK_SCALE = 1;
        QT_SCALE_FACTOR = "1.0";
        QT_QPA_PLATFORM = "wayland;xcb";
        # QT_QPA_PLATFORMTHEME = "qt6ct";
    };

    hardware = {
        # Drawing tablet driver
        opentabletdriver.enable = true;
        # Brightness control
        brillo.enable = true;
        graphics = {
            enable = true;
            enable32Bit = true;
            extraPackages = with pkgs; [
                rocmPackages.clr.icd
            ];
        };
    };

    virtualisation = {
        podman = {
            enable = true;
            # dockerCompat = true;
        };
        docker.enable = true;
    };

    nix.settings.experimental-features = [
        "nix-command"
        "flakes"
    ];

    system.stateVersion = "26.05";
}
