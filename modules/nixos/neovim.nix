{
  inputs,
  pkgs,
  ...
}:
{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;

      # TODO: seems to be bugged right now
      # package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

      # enable providers for plugins in other languages than lua
      withPython3 = true;
      withNodeJs = true;
    };
  };

  # neovim dependencies
  environment.systemPackages = with pkgs; [
    tree-sitter
    gcc
    lua5_1
    lua51Packages.tiktoken_core
    # TODO: figure which is the right tiktoken package for neovim
    # lua
    # luaPackages.tiktoken_core
    # luajitPackages.tiktoken_core
    luajit
    luarocks
    lynx
    viu
    chafa
    nodejs
    python3
    rustc
    cargo
    lazygit
    ripgrep
    fd
    sqlite

    # WIP: not sure that all of these are picked up correctly by neovim
    # lsp/linters/etc.
    bash-language-server
    black
    # lazyhealth complians about not finding debugpy, let's give it some options ...
    python3Packages.debugpy
    # python312Packages.debugpy
    # python313Packages.debugpy
    docker-compose-language-service
    dockerfile-language-server-nodejs
    hadolint
    helm-ls
    lua-language-server
    nodePackages.vscode-json-languageserver
    vscode-langservers-extracted
    # markdown-toc # TODO: what is the packge name?
    markdownlint-cli2 # TODO: this is not recognized
    marksman
    nil
    nixd
    nixfmt-rfc-style
    nodePackages.prettier
    pyright
    basedpyright
    ruff
    shellcheck
    shfmt
    sqlfluff
    stylua
    taplo
    terraform
    opentofu
    terraform-ls
    tflint
    yaml-language-server
    rust-analyzer
    rustup
    lldb
    go
    gofumpt
    gotools
    delve
    gotestsum
    mermaid-cli
    uv
  ];
}
