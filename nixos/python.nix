{ pkgs, inputs, lib, ... }:
{

 environment.systemPackages = with pkgs; [
   (python313.withPackages(ps: with ps;
   [
     ollama
     pyppeteer
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
      gymnasium
      pygame
      pybox2d
      pylint
      moviepy
      bsuite
      torchvision
      (opencv4.override { enableGtk3 = true; })
      smolagents
      h5py

      playwright

      beautifulsoup4

    ]))
  ];

}
