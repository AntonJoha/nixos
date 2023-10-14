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
    ranger
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
          vim-gitgutter
          tagbar
          ranger-vim
          neoformat
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

          " Enable alignment
          let g:neoformat_basic_format_align = 1

          " Enable tab to space conversion
          let g:neoformat_basic_format_retab = 1

          " Enable trimmming of trailing whitespace
          let g:neoformat_basic_format_trim = 1

          " Tagbar
          autocmd VimEnter * nested :call tagbar#autoopen(1)
          autocmd FileType * nested :call tagbar#autoopen(0)

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



