{ pkgs, ... }:

let
  vimConfig = ''
    set smarttab
    set softtabstop=0
    set shiftwidth=2
    set autoindent
    set showcmd
    let b:ale_fixers = ['prettier', 'eslint']
    let g:ale_completion_enabled = 1
    set omnifunc=ale#completion#OmniFunc
    let g:ale_completion_autoimport = 1
    let g:airline_theme='fruit_punch'
    let g:airline_powerline_fonts = 1
    colorscheme OceanicNext
  '';
in
{
  programs.vim = {
    enable = true;

    extraConfig = vimConfig;

    plugins = with pkgs.vimPlugins; [
      ale
      awesome-vim-colorschemes
      ctrlp
      emmet-vim
      fugitive
      nerdtree
      vim-airline
      vim-airline-themes
      vim-css-color
      vim-devicons
      vim-gitgutter
      vim-jsx-pretty
      vim-one
      vim-surround
    ];

    settings = {
      expandtab = true;
      number = true;
      relativenumber = true;
      tabstop = 2;
    };
  };
}
