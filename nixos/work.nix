{ pkgs, inputs, lib, ... }:
{

 environment.systemPackages = with pkgs; [
   minikube
   go
   docker

 ];

virtualisation.docker.enable = true;

#networking.wg-quick.interfaces = {
  #"wg0" = {
    #privateKeyFile = "/home/kentagent/.config/wireguard/privatekey";
    #address = [ "10.200.1.25/32" ];

    #peers = [
    #  {
    #    publicKey = "wtZ9rwfK4sQ0rbX7NvOQtM/Q6/VgJdUZETCL8C8CSWQ=";
        #allowedIPs = [ "10.200.1.0/24" ];
        #endpoint = "130.243.27.211:51820";
      #}
    #];
  #};
#};

networking.firewall.allowedUDPPorts = [ 51820 ];
networking.wg-quick.interfaces.wg0.configFile = "/home/kentagent/.config/wireguard/config";

networking.networkmanager.dns = "systemd-resolved";
services.resolved.enable = true;

}
