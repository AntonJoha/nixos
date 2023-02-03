{ pkgs, inputs, lib, ... }:
{


 environment.systemPackages = with pkgs; [
   (python310.withPackages(ps: with ps; 
   [ 
      numpy
      jedi
      mininet-python
      pyqt5
      networkx
      termcolor
      tkinter
      pillow
   ]))
  ];

}
