{ ... }:
{
    services.flatpak = {
        enable = true;
        packages = [
            { appId = "com.stremio.Stremio"; origin = "flathub"; }
            { appId = "net.waterfox.waterfox"; origin = "flathub"; }
            { appId = "com.spotify.Client"; origin = "flathub"; }
        ];
    };
    programs.appimage = {
        enable = true;
        binfmt = true;
    };
}
