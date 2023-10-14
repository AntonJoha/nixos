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
   eclipses.eclipse-sdk
 ];

virtualisation.docker.enable = true;




}


