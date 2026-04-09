{ ... }:
{
    services.flatpak = {
        enable = true;
        packages = [
            { appId = "com.spotify.Client"; origin = "flathub"; }
            { appId = "com.stremio.Stremio"; origin = "flathub"; }
            { appId = "md.obsidian.Obsidian"; origin = "flathub"; }
            { appId = "net.waterfox.waterfox"; origin = "flathub"; }
        ];
    };
    programs.appimage = {
        enable = true;
        binfmt = true;
    };
}
