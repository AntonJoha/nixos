{ pkgs, inputs, lib, ... }:
{


 environment.systemPackages = with pkgs; [
   kind
   kubernetes-helm
   kubernetes
   go
  docker
 ];

virtualisation.docker.enable = true;




}


