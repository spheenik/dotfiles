syntax enable
set clipboard=unnamedplus
set background=dark
set mouse=a

command W silent execute 'write !sudo tee ' . shellescape(@%, 1) . ' >/dev/null'
