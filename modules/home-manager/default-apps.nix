{
  ...
}:
{
  xdg.mimeApps = {
    enable = true; # generates ~/.config/mimeapps.list
    defaultApplications = {
      # Web
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "text/html" = "firefox.desktop";

      # Images
      "image/jpeg" = "imv.desktop";
      "image/png" = "imv.desktop";
      "image/gif" = "imv.desktop";
      "image/bmp" = "imv.desktop";
      "image/svg+xml" = "imv.desktop";

      # Audio / video
      "video/mp4" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
      "audio/mpeg" = "mpv.desktop";
      "audio/ogg" = "mpv.desktop";

      # PDF
      "application/pdf" = "sioyek.desktop";

      # Mail
      "x-scheme-handler/mailto" = "thunderbird.desktop";

      # Directories
      "inode/directory" = "thunar.desktop";

      # Plain text / source
      "text/plain" = "nvim.desktop";

      # Optional: terminal URI handler
      "x-scheme-handler/terminal" = "kitty.desktop";
    };
  };
}
