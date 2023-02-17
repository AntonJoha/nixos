{ pkgs, inputs, lib, ... }:
{


 environment.systemPackages = with pkgs; [
   kind
   kubernetes-helm
   kubernetes
   go
   docker
   openvpn3
 ];

virtualisation.docker.enable = true;




}


