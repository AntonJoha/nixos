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

  environment.variables = { EDITOR = "nvim"; };

  environment.systemPackages = with pkgs; [
    
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
          nvim-treesitter.withAllGrammars
          vim-gutentags
          coc-nvim
          coc-rust-analyzer
          coc-clangd
          coc-vimtex
          vimtex
          coc-pyright
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

          let g:airline#extensions#coc#enabled = 1

          let g:neoformat_enabled_python = ['autopep8']
          call coc#config('python.analysis.typeCheckingMode', 'off')
          call coc#config('python.analysis.inlayHints.variableTypes', v:false)
          call coc#config('python.analysis.inlayHints.functionReturnTypes', v:false)
          call coc#config('python.analysis.inlayHints.callArgumentNames', v:false)

          " Enable tab to space conversion
          let g:neoformat_basic_format_retab = 1

          " Enable trimmming of trailing whitespace
          let g:neoformat_basic_format_trim = 1


          " Tagbar
          autocmd VimEnter * nested :call tagbar#autoopen(1)
          autocmd FileType * nested :call tagbar#autoopen(0)

          let g:rustfmt_autosave = 1
          let wiki_1 = {}
          let wiki_1.path = '~/vimwiki/'
          let wiki_1.syntax = 'markdown'
          let wiki_1.ext = '.md'
          
          let g:vimwiki_list = [wiki_1]
          let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

          "Remapping for the terminal command to allow <ESC> instead of \N combination
          tnoremap <Esc> <C-\><C-n><CR>
          augroup python_autoformat
            autocmd!
            autocmd BufWritePre *.py silent! Neoformat
          augroup END

          lua <<EOF
            vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
          EOF

          " ...
        '';
      };
      extraPythonPackages = p: with p;
      [
        jedi
        autopep8
      ];
    }
  )];
}

