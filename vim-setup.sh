#enable proxy
#sed -i 's|#https_proxy = http://proxy.yoyodyne.com:18023/|https_proxy = http://10.12.204.35:30000/|g' /etc/wgetrc
#sed -i 's|#http_proxy = http://proxy.yoyodyne.com:18023/|http_proxy = http://10.12.204.35:30000/|g' /etc/wgetrc
#sed -i 's|#ftp_proxy = http://proxy.yoyodyne.com:18023/|ftp_proxy = http://10.12.204.35:30000/|g' /etc/wgetrc
#sed -i 's/#use_proxy/use_proxy/g' /etc/wgetrc

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
filetype plugin on
set omnifunc=syntaxcomplete#Complete
EOF

mkdir -p ~/.vim/autoload/
cd ~/.vim/autoload/
#pythoncomplete
#http://www.vim.org/scripts/script.php?script_id=1542
wget -O pythoncomplete.vim http://www.vim.org/scripts/download_script.php?src_id=10872
mkdir -p ~/.vim/bundle/
cd ~/.vim/bundle/
#https://github.com/vim-scripts/AutoComplPop
mkdir -p ~/.vim/autoload/
cd ~/.vim/autoload/
wget https://raw.githubusercontent.com/vim-scripts/AutoComplPop/master/autoload/acp.vim
mkdir -p ~/.vim/doc/
cd ~/.vim/doc/
wget https://raw.githubusercontent.com/vim-scripts/AutoComplPop/master/doc/acp.txt
cd ~
wget -O bicyclerepair-0.9.tar.gz "https://downloads.sourceforge.net/project/bicyclerepair/bicyclerepair/0.9/bicyclerepair-0.9.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fbicyclerepair%2Ffiles%2Fbicyclerepair%2F0.9%2F&ts=1486849212&use_mirror=superb-sea2"
tar xvf bicyclerepair-0.9.tar.gz
cd ~/bicyclerepair-0.9
sudo python setup.py install
cp ~/bicyclerepair-0.9/ide-integration/bike.vim ~/.vim/autoload/
#SuperTab
#http://www.vim.org/scripts/script.php?script_id=1643
mkdir -p ~/.vim/bundle/
cd ~/.vim/bundle/
wget -O supertab.vmb http://www.vim.org/scripts/download_script.php?src_id=21752
vim ~/.vim/bundle/supertab.vmb
