{ pkgs, inputs, lib, ... }:
{

  environment.systemPackages = with pkgs; [
    rustup
    rust-analyzer
    gcc
  ];

}
