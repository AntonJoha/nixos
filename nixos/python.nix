{ pkgs, inputs, lib, ... }:
{


 environment.systemPackages = with pkgs; [
   (python310.withPackages(ps: with ps; 
   [ 
      numpy
      jedi
      pyqt5
      flask
      pillow
      tkinter
      networkx
      termcolor
      jupyter
      requests
   ]))
  ];

}
