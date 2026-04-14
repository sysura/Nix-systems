{config, pkgs, ...}:

{
  programs.obsidian = {
    enable = true;
    package = pkgs.obsidian;
    defaultSettings = {
      corePlugins = [
        "backlinks"
        "bases"
        "bookmarks"
        "canvas"
        "command-palette"
        "daily-notes"
        "file-recovery"
        "files"
        "graph-view"
        "note-composer"
        "outgoing-links"
        "outline"
        "page-preview"
        "properties-view"
        "quick-switcher"
        "search"
        "tags-view"
        "templates"
        "word-count"
      ];
      communityPlugins = [
        "excalidraw"
      ];
    };
  };
}
