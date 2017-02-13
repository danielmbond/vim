#enable proxy
sudo sed -i 's|#https_proxy = http://proxy.yoyodyne.com:18023/|https_proxy = http://10.12.204.35:30000/|g' /etc/wgetrc
sudo sed -i 's|#http_proxy = http://proxy.yoyodyne.com:18023/|http_proxy = http://10.12.204.35:30000/|g' /etc/wgetrc
sudo sed -i 's|#ftp_proxy = http://proxy.yoyodyne.com:18023/|ftp_proxy = http://10.12.204.35:30000/|g' /etc/wgetrc
sudo sed -i 's/#use_proxy/use_proxy/g' /etc/wgetrc

export http_proxy=http://10.12.204.35:30000
export https_proxy=http://10.12.204.35:30000
git config --global http.proxy $http_proxy

tee ~/.vimrc <<-'EOF'
" comment out the following line if using a light terminal background
set background=dark

" uncomment whichever you prefer:
syntax on
"syntax off

set ruler
set showmatch
set nohls

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set tabstop=8
set noexpandtab
set backspace=indent,eol,start

" the following line contains non-printable control character(s)
ino # .^H#

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal g'\"" | endif
endif

"if &term =~ "xterm"
  if has("terminfo")
  " the following lines contains non-printable control character(s)
  set t_Co=8
  set t_Sf=^[[3%p1%dm
  set t_Sb=^[[4%p1%dm
  else
  " the following lines contains non-printable control character(s)
  set t_Co=8
  set t_Sf=^[[3%dm
  set t_Sb=^[[4%dm
  endif
"endif

"enable autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
"pathogen settings
execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes']
EOF

mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/doc/
cd ~/.vim/autoload/
#pythoncomplete
#http://www.vim.org/scripts/script.php?script_id=1542
curl -LSso  ~/.vim/autoload/pythoncomplete.vim http://www.vim.org/scripts/download_script.php?src_id=10872
cd ~/.vim/bundle/
#https://github.com/vim-scripts/AutoComplPop
mkdir -p ~/.vim/autoload/
cd ~/.vim/autoload/
curl -LSso ~/.vim/bundle/acp.vim https://raw.githubusercontent.com/vim-scripts/AutoComplPop/master/autoload/acp.vim
cd ~/.vim/doc/
curl -LSso ~/.vim/doc/acp.txt https://raw.githubusercontent.com/vim-scripts/AutoComplPop/master/doc/acp.txt
cd ~
curl -LSso ~/bicyclerepair-0.9.tar.gz "https://downloads.sourceforge.net/project/bicyclerepair/bicyclerepair/0.9/bicyclerepair-0.9.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fbicyclerepair%2Ffiles%2Fbicyclerepair%2F0.9%2F&ts=1486849212&use_mirror=superb-sea2"
tar xvf bicyclerepair-0.9.tar.gz
cd ~/bicyclerepair-0.9
sudo python setup.py install
cp ~/bicyclerepair-0.9/ide-integration/bike.vim ~/.vim/autoload/
#Pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
#Syntastic
cd ~/.vim/bundle && \
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
#fugitive
cd ~/.vim/bundle
git clone https://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q
#SuperTab
#http://www.vim.org/scripts/script.php?script_id=1643
mkdir -p ~/.vim/bundle/
cd ~/.vim/bundle/
curl -LSso ~/.vim/bundle/supertab.vmb http://www.vim.org/scripts/download_script.php?src_id=21752
vim ~/.vim/bundle/supertab.vmb
