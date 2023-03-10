{ pkgs, inputs, lib, ... }:
{


 environment.systemPackages = with pkgs; [
   kind
   kubernetes-helm
   kubernetes
   go
   docker
   openvpn
 ];

virtualisation.docker.enable = true;




}


