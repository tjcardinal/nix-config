{ pkgs, ... }:
let
  myVscodium = with pkgs; (vscode-with-extensions.override {
    vscode = vscodium;
    vscodeExtensions = with vscode-extensions; [
      bbenoist.nix
      asvetliakov.vscode-neovim
      rust-lang.rust-analyzer
    ];
  });
in
{
  environment.systemPackages = [ myVscodium ];
}
