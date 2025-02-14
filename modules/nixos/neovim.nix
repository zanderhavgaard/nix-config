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

      package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

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

    # WIP: not sure that all of these are picked up correctly by neovim
    # lsp/linters/etc.
    bash-language-server
    black
    python3Packages.debugpy
    docker-compose-language-service
    dockerfile-language-server-nodejs
    hadolint
    helm-ls
    lua-language-server
    nodePackages.vscode-json-languageserver
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
  ];
}
