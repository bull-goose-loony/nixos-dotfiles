{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # Lua
    lua-language-server

    # Python
    basedpyright
    python312
    python312Packages.pip
    python312Packages.virtualenv

    # C/C++
    clang-tools
    clang
    llvm
    lld

    # Nix
    nil
    alejandra

    # Rust
    rust-analyzer
    rustfmt

    # Web / JS / TS
    nodejs
    typescript
    typescript-language-server
    vscode-langservers-extracted
  ];
}
