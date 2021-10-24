CUR_LOCATION=$(pwd)/

#ensure folders
mkdir ~/.config/
mkdir ~/.config/nvim/

#Symlink config files
ln -s ${CUR_LOCATION}alacritty/alacritty.yml ~/.alacritty.yml
ln -s ${CUR_LOCATION}nvim/init.vim ~/.config/nvim/init.vim


#Install Rust stuff
if ! hash cargo &> /dev/null
then
  echo "install rust"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

if ! hash alacritty &> /dev/null
then
   cargo install alacritty
fi

if ! hash "z" &> /dev/null
then
   echo "install zoxide"
   cargo install zoxide
fi

if ! hash rg &> /dev/null
then
   echo "install ripgrep"
   cargo install ripgrep
fi

