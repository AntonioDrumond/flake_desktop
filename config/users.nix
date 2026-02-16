{ pkgs, ... }:
{
    users.users.antonio = {
        isNormalUser = true;
        description = "Antonio Drumond";
        extraGroups = [
            "networkmanager"
            "wheel"
            "libvirtd"
            "video"
            "docker"
        ];
        packages = with pkgs; [
            kdePackages.kate
        ];
        shell = pkgs.fish;
    };

    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

    services.openssh = {
        enable = true;
        ports = [ 22 ];
        settings = {
            PasswordAuthentication = true;
            AllowUsers = null;
            UseDns = true;
            X11Forwarding = false;
            PermitRootLogin = "no";
        };
    };
    services.tailscale.enable = true;
}
