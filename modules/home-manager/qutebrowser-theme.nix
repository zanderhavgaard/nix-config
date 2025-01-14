# OneDark theme adapted from https://github.com/leandwo/qutebrowser-themes/blob/master/themes/onedark.py
{ ... }:
let
  bg_default = "#282c34"; # main shade darkest
  bg_lighter = "#353b45";
  bg_selection = "#3e4451";
  fg_disabled = "#565c64";
  fg_default = "#abb2bf";
  bg_lightest = "#c8ccd4"; # main shade lightest
  fg_error = "#e06c75"; # red
  bg_hint = "#e5c07b"; # yellow
  fg_matched_text = "#98c379"; # green
  bg_passthrough_mode = "#56b6c2"; # teal
  bg_insert_mode = "#61afef"; # blue
  bg_warning = "#c678dd"; # purple
in
{
  programs.qutebrowser = {
    settings = {
      # Text color of the completion widget. May be a single color to use for
      # all columns or a list of three colors, one for each column.
      colors.completion.fg = fg_default;

      # Background color of the completion widget for odd rows.
      colors.completion.odd.bg = bg_lighter;

      # Background color of the completion widget for even rows.
      colors.completion.even.bg = bg_default;

      # Foreground color of completion widget category headers.
      colors.completion.category.fg = bg_hint;

      # Background color of the completion widget category headers.
      colors.completion.category.bg = bg_default;

      # Top border color of the completion widget category headers.
      colors.completion.category.border.top = bg_default;

      # Bottom border color of the completion widget category headers.
      colors.completion.category.border.bottom = bg_default;

      # Foreground color of the selected completion item.
      colors.completion.item.selected.fg = fg_default;

      # Background color of the selected completion item.
      colors.completion.item.selected.bg = bg_selection;

      # Top border color of the selected completion item.
      colors.completion.item.selected.border.top = bg_selection;

      # Bottom border color of the selected completion item.
      colors.completion.item.selected.border.bottom = bg_selection;

      # Foreground color of the matched text in the selected completion item.
      colors.completion.item.selected.match.fg = fg_matched_text;

      # Foreground color of the matched text in the completion.
      colors.completion.match.fg = fg_matched_text;

      # Color of the scrollbar handle in the completion view.
      colors.completion.scrollbar.fg = fg_default;

      # Color of the scrollbar in the completion view.
      colors.completion.scrollbar.bg = bg_default;

      # Background color of disabled items in the context menu.
      colors.contextmenu.disabled.bg = bg_lighter;

      # Foreground color of disabled items in the context menu.
      colors.contextmenu.disabled.fg = fg_disabled;

      # Background color of the context menu. If set to null, the Qt default is used.
      colors.contextmenu.menu.bg = bg_default;

      # Foreground color of the context menu. If set to null, the Qt default is used.
      colors.contextmenu.menu.fg = fg_default;

      # Background color of the context menu’s selected item. If set to null, the Qt default is used.
      colors.contextmenu.selected.bg = bg_selection;

      #Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
      colors.contextmenu.selected.fg = fg_default;

      # Background color for the download bar.
      colors.downloads.bar.bg = bg_default;

      # Color gradient start for download text.
      colors.downloads.start.fg = bg_default;

      # Color gradient start for download backgrounds.
      colors.downloads.start.bg = bg_insert_mode;

      # Color gradient end for download text.
      colors.downloads.stop.fg = bg_default;

      # Color gradient stop for download backgrounds.
      colors.downloads.stop.bg = bg_passthrough_mode;

      # Foreground color for downloads with errors.
      colors.downloads.error.fg = fg_error;

      # Font color for hints.
      colors.hints.fg = bg_default;

      # Background color for hints. Note that you can use a `rgba(...)` value
      # for transparency.
      colors.hints.bg = bg_hint;

      # Font color for the matched part of hints.
      colors.hints.match.fg = fg_default;

      # Text color for the keyhint widget.
      colors.keyhint.fg = fg_default;

      # Highlight color for keys to complete the current keychain.
      colors.keyhint.suffix.fg = fg_default;

      # Background color of the keyhint widget.
      colors.keyhint.bg = bg_default;

      # Foreground color of an error message.
      colors.messages.error.fg = bg_default;

      # Background color of an error message.
      colors.messages.error.bg = fg_error;

      # Border color of an error message.
      colors.messages.error.border = fg_error;

      # Foreground color of a warning message.
      colors.messages.warning.fg = bg_default;

      # Background color of a warning message.
      colors.messages.warning.bg = bg_warning;

      # Border color of a warning message.
      colors.messages.warning.border = bg_warning;

      # Foreground color of an info message.
      colors.messages.info.fg = fg_default;

      # Background color of an info message.
      colors.messages.info.bg = bg_default;

      # Border color of an info message.
      colors.messages.info.border = bg_default;

      # Foreground color for prompts.
      colors.prompts.fg = fg_default;

      # Border used around UI elements in prompts.
      colors.prompts.border = bg_default;

      # Background color for prompts.
      colors.prompts.bg = bg_default;

      # Background color for the selected item in filename prompts.
      colors.prompts.selected.bg = bg_selection;

      # Foreground color for the selected item in filename prompts.
      colors.prompts.selected.fg = fg_default;

      # Foreground color of the statusbar.
      colors.statusbar.normal.fg = fg_matched_text;

      # Background color of the statusbar.
      colors.statusbar.normal.bg = bg_default;

      # Foreground color of the statusbar in insert mode.
      colors.statusbar.insert.fg = bg_default;

      # Background color of the statusbar in insert mode.
      colors.statusbar.insert.bg = bg_insert_mode;

      # Foreground color of the statusbar in passthrough mode.
      colors.statusbar.passthrough.fg = bg_default;

      # Background color of the statusbar in passthrough mode.
      colors.statusbar.passthrough.bg = bg_passthrough_mode;

      # Foreground color of the statusbar in private browsing mode.
      colors.statusbar.private.fg = bg_default;

      # Background color of the statusbar in private browsing mode.
      colors.statusbar.private.bg = bg_lighter;

      # Foreground color of the statusbar in command mode.
      colors.statusbar.command.fg = fg_default;

      # Background color of the statusbar in command mode.
      colors.statusbar.command.bg = bg_default;

      # Foreground color of the statusbar in private browsing + command mode.
      colors.statusbar.command.private.fg = fg_default;

      # Background color of the statusbar in private browsing + command mode.
      colors.statusbar.command.private.bg = bg_default;

      # Foreground color of the statusbar in caret mode.
      colors.statusbar.caret.fg = bg_default;

      # Background color of the statusbar in caret mode.
      colors.statusbar.caret.bg = bg_warning;

      # Foreground color of the statusbar in caret mode with a selection.
      colors.statusbar.caret.selection.fg = bg_default;

      # Background color of the statusbar in caret mode with a selection.
      colors.statusbar.caret.selection.bg = bg_insert_mode;

      # Background color of the progress bar.
      colors.statusbar.progress.bg = bg_insert_mode;

      # Default foreground color of the URL in the statusbar.
      colors.statusbar.url.fg = fg_default;

      # Foreground color of the URL in the statusbar on error.
      colors.statusbar.url.error.fg = fg_error;

      # Foreground color of the URL in the statusbar for hovered links.
      colors.statusbar.url.hover.fg = fg_default;

      # Foreground color of the URL in the statusbar on successful load
      # (http).
      colors.statusbar.url.success.http.fg = bg_passthrough_mode;

      # Foreground color of the URL in the statusbar on successful load
      # (https).
      colors.statusbar.url.success.https.fg = fg_matched_text;

      # Foreground color of the URL in the statusbar when there's a warning.
      colors.statusbar.url.warn.fg = bg_warning;

      # Background color of the tab bar.
      colors.tabs.bar.bg = bg_default;

      # Color gradient start for the tab indicator.
      colors.tabs.indicator.start = bg_insert_mode;

      # Color gradient end for the tab indicator.
      colors.tabs.indicator.stop = bg_passthrough_mode;

      # Color for the tab indicator on errors.
      colors.tabs.indicator.error = fg_error;

      # Foreground color of unselected odd tabs.
      colors.tabs.odd.fg = fg_default;

      # Background color of unselected odd tabs.
      colors.tabs.odd.bg = bg_lighter;

      # Foreground color of unselected even tabs.
      colors.tabs.even.fg = fg_default;

      # Background color of unselected even tabs.
      colors.tabs.even.bg = bg_default;

      # Background color of pinned unselected even tabs.
      colors.tabs.pinned.even.bg = bg_passthrough_mode;

      # Foreground color of pinned unselected even tabs.
      colors.tabs.pinned.even.fg = bg_lightest;

      # Background color of pinned unselected odd tabs.
      colors.tabs.pinned.odd.bg = fg_matched_text;

      # Foreground color of pinned unselected odd tabs.
      colors.tabs.pinned.odd.fg = bg_lightest;

      # Background color of pinned selected even tabs.
      colors.tabs.pinned.selected.even.bg = bg_selection;

      # Foreground color of pinned selected even tabs.
      colors.tabs.pinned.selected.even.fg = fg_default;

      # Background color of pinned selected odd tabs.
      colors.tabs.pinned.selected.odd.bg = bg_selection;

      # Foreground color of pinned selected odd tabs.
      colors.tabs.pinned.selected.odd.fg = fg_default;

      # Foreground color of selected odd tabs.
      colors.tabs.selected.odd.fg = fg_default;

      # Background color of selected odd tabs.
      colors.tabs.selected.odd.bg = bg_selection;

      # Foreground color of selected even tabs.
      colors.tabs.selected.even.fg = fg_default;

      # Background color of selected even tabs.
      colors.tabs.selected.even.bg = bg_selection;
    };
  };
}
