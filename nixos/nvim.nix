{ pkgs, inputs, lib, ... }:
{

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    defaultEditor = true;
    withRuby = false;
  };

nixpkgs.overlays = [
   (self: super: {
     neovim = super.neovim.override {
       viAlias = true;
       vimAlias = true;
     };
   })
 ];

  environment.variables = { EDITOR = "vim"; };

  environment.systemPackages = with pkgs; [
    
    nodejs-16_x
    clang-tools
    universal-ctags
    (neovim.override {
      vimAlias = true;
      configure = {
        packages.myPlugins = with pkgs.vimPlugins; {
          start = [ vim-lastplace
          vim-nix
          vim-airline
          rust-vim
          nvim-lspconfig
          nvim-treesitter
          vim-gutentags
          coc-nvim
          coc-rust-analyzer
          coc-clangd
          coc-vimtex
          coc-go
          vimtex
          coc-python
          nord-nvim
          copilot-vim
          vimwiki
          vim-fugitive
        ]; 
          opt = [];
        };
        customRC = ''
          " your custom vimrc
          set nocompatible
          set backspace=indent,eol,start
          set spell
          set spelllang=en,sv

          set tabstop=4
          set noexpandtab
          set autoindent
          set shiftwidth=4

          set foldmethod=indent

          set number
          set relativenumber
          let g:tex_flavor = 'latex'
          colorscheme nord
          colorscheme evening
          hi Pmenu guibg=grey


          let g:rustfmt_autosave = 1

          "Remapping for the terminal command to allow <ESC> instead of \N combination
          tnoremap <Esc> <C-\><C-n><CR>

          lua <<EOF
            vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
          EOF

          " ...
        '';
      };
      extraPythonPackages = p: with p;
      [
        jedi
      ];
    }
  )];
}



