{ pkgs, inputs, lib, ... }:
{


 environment.systemPackages = with pkgs; [
   kind
   kubernetes-helm
   kubernetes
   minikube
   go
   docker
   openvpn
 ];

virtualisation.docker.enable = true;




}


