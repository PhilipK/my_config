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


if ! hash alacritty &> /dev/null
then
   cargo install alacritty
fi


#Install Rust stuff
if ! hash cargo &> /dev/null
then
  echo "install rust"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

cargo install zoxide
cargo install ripgrep

#Rust analyzer server
if ! hash rust-analyzer &> /dev/null
then 
	curl -L https://github.com/rust-analyzer/rust-analyzer/releases/download/nightly/rust-analyzer-x86_64-unknown-linux-gnu.gz --output ~/my_tools/rust-analyzer.gz
	gunzip ~/my_tools/rust-analyzer.gz
	chmod +x ~/my_tools/rust-analyzer
	rm ~/my_tools/rust-analyzer.gz


fi 

#upx
if ! hash upx &> /dev/null
then 
	curl -L https://github.com/upx/upx/releases/download/v3.96/upx-3.96-amd64_linux.tar.xz --output ~/my_tools/upx.xz
	tar -xf ~/my_tools/upx.xz -C ~/my_tools/
	mv ~/my_tools/upx-3.96-amd64_linux/upx ~/my_tools/upx
	rm ~/my_tools/upx.xz
	rm -rf ~/my_tools/upx-3.96-amd64_linux
	chmod +x ~/my_tools/upx
fi 

git config --global core.editor nvim
git config --global user.name "Philip Kristoffersen"
git config --global user.email "philipkristoffersen@gmail.com"


