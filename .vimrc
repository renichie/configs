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

"===========================remapping keys======================================
noremap j h
noremap k j
noremap l k
noremap ö l
noremap ; l

nnoremap j h
nnoremap k j
nnoremap l k
nnoremap ö l
nnoremap ; l

vnoremap j h
vnoremap k j
vnoremap l k
vnoremap ö l
vnoremap ; l

"===========================tab navigation======================================
nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>                                                                            
nnoremap <C-k> :tabnext<CR>

"see https://stackoverflow.com/questions/6638290/how-to-make-shortcut-for-tabnew-tabn-tabp
"===========================tab cmd shortcuts======================================
cnoreabbrev <expr> tn getcmdtype() == ":" && getcmdline() == 'tn' ? 'tabnew' : 'tn'
cnoreabbrev <expr> th getcmdtype() == ":" && getcmdline() == 'th' ? 'tabp' : 'th'
cnoreabbrev <expr> tl getcmdtype() == ":" && getcmdline() == 'tl' ? 'tabn' : 'tl'
cnoreabbrev <expr> te getcmdtype() == ":" && getcmdline() == 'te' ? 'tabedit' : 'te'