CUR_LOCATION=$(pwd)/

#ensure folders
mkdir -p ~/.config/nvim/


#Symlink config files
ln -sf ${CUR_LOCATION}alacritty/alacritty.yml ~/.alacritty.yml
ln -sf ${CUR_LOCATION}nvim/init.vim ~/.config/nvim/init.vim
ln -sf ${CUR_LOCATION}bash/.bashrc ~/.bashrc

mkdir -p ~/my_tools/

#Intall nvim

if ! hash nvim &> /dev/null
then
  echo "install nvim"
  curl -L https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage --output ~/my_tools/nvim
  chmod +x ~/my_tools/nvim
fi


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

if ! hash z &> /dev/null
then
   echo "install zoxide"
   cargo install zoxide
fi

if ! hash rg &> /dev/null
then
   echo "install ripgrep"
   cargo install ripgrep
fi

#Rust analyzer server
if ! hash rust-analyzer &> /dev/null
then 
	curl -L https://github.com/rust-analyzer/rust-analyzer/releases/download/nightly/rust-analyzer-x86_64-unknown-linux-gnu.gz --output ~/my_tools/rust-analyzer.gz
	gunzip ~/my_tools/rust-analyzer.gz
	chmod +x ~/my_tools/rust-analyzer
fi 
