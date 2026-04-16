{ pkgs, inputs, lib, ... }:
{

 environment.systemPackages = with pkgs; [
   minikube
   go
   docker

 ];

virtualisation.docker.enable = true;


networking.firewall.allowedUDPPorts = [ 51820 ];
networking.wg-quick.interfaces.wg0.configFile = "/home/kentagent/.config/wireguard/config";

networking.networkmanager.dns = "systemd-resolved";
services.resolved.enable = true;

}
