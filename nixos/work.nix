{ pkgs, inputs, lib, ... }:
{


 environment.systemPackages = with pkgs; [
   minikube
   go
 ];





}


