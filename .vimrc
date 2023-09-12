"===========================general settings======================================
set noswapfile
set number
set mouse=a
syntax on
set clipboard=unnamedplus
colo delek
set tabstop=4
set ai "setzt autoindent
set si "setzt smart indent
colorscheme desert

"===========================remapping keys======================================
noremap j h
noremap k j
noremap l k
noremap ö l
noremap ; l

"===========================tab navigation======================================
nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>                                                                            
nnoremap <C-k> :tabnext<CR>

"===========================split tab navigation================================
"nnoremap <C-J> <C-W><C-H>
"nnoremap <C-K> <C-W><C-J>
"nnoremap <C-L> <C-W><C-K>
"nnoremap <C-?> <C-W><C-L>
"nnoremap <C-;> <C-W><C-L>

"see https://stackoverflow.com/questions/6638290/how-to-make-shortcut-for-tabnew-tabn-tabp
"===========================tab cmd shortcuts======================================
cnoreabbrev <expr> tn getcmdtype() == ":" && getcmdline() == 'tn' ? 'tabnew' : 'tn'
cnoreabbrev <expr> th getcmdtype() == ":" && getcmdline() == 'th' ? 'tabp' : 'th'
cnoreabbrev <expr> tl getcmdtype() == ":" && getcmdline() == 'tl' ? 'tabn' : 'tl'
cnoreabbrev <expr> te getcmdtype() == ":" && getcmdline() == 'te' ? 'tabedit' : 'te'

"=========================== search visually selected text ========================
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"unmap <C-b>

"=========================== plugins ===============================================
"call plug#begin()
"Plug 'https://github.com/sainnhe/everforest'
"call plug#end()