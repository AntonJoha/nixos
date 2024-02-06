{ pkgs, inputs, lib, ... }:
{


 environment.systemPackages = with pkgs; [
   (python311.withPackages(ps: with ps; 
   [ 
      numpy
      jedi
      pillow
      tkinter
      termcolor
      jupyter
      requests
      pandas
      matplotlib
      torch
      pyqt5
      pytest
      seaborn
    ]))
  ];

}
