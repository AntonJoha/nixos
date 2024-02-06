{ pkgs, inputs, lib, ... }:
{


 environment.systemPackages = with pkgs; [
   minikube
   go
   docker
 ];

virtualisation.docker.enable = true;




}


