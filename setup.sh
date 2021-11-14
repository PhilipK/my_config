CUR_LOCATION=$(pwd)/

#ensure folders
mkdir -p ~/.config/nvim/
mkdir -p ~/.config/i3blocks/
mkdir -p ~/.config/i3/


#Symlink config files
ln -sf ${CUR_LOCATION}alacritty/alacritty.yml ~/.alacritty.yml
ln -sf ${CUR_LOCATION}nvim/init.vim ~/.config/nvim/init.vim
ln -sf ${CUR_LOCATION}bash/.bashrc ~/.bashrc
ln -sf ${CUR_LOCATION}i3/config ~/.config/i3/config
ln -sf ${CUR_LOCATION}i3/blocks ~/.config/i3blocks/config
ln -sf ${CUR_LOCATION}i3/workspaces ~/.config/i3/workspaces
mkdir -p ~/my_tools/


#Intall nvim
if ! hash nvim &> /dev/null
then

   if hash pacman &> /dev/null
   then
      echo "install nvim"
      curl -L https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage --output ~/my_tools/nvim
      chmod +x ~/my_tools/nvim
   else
      pacman -S neovim
   fi
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


cargo install zoxide
cargo install ripgrep

#Rust analyzer server
if ! hash rust-analyzer &> /dev/null
then 

   if hash pacman &> /dev/null
   then
      curl -L https://github.com/rust-analyzer/rust-analyzer/releases/download/nightly/rust-analyzer-x86_64-unknown-linux-gnu.gz --output ~/my_tools/rust-analyzer.gz
      gunzip ~/my_tools/rust-analyzer.gz
      chmod +x ~/my_tools/rust-analyzer
      rm ~/my_tools/rust-analyzer.gz
   else
      pacman -S rust-analyzer
   fi

fi 

#upx
if ! hash upx &> /dev/null
then 
   if hash pacman &> /dev/null
   then
      packman -S upx
   else
      curl -L https://github.com/upx/upx/releases/download/v3.96/upx-3.96-amd64_linux.tar.xz --output ~/my_tools/upx.xz
      tar -xf ~/my_tools/upx.xz -C ~/my_tools/
      mv ~/my_tools/upx-3.96-amd64_linux/upx ~/my_tools/upx
      rm ~/my_tools/upx.xz
      rm -rf ~/my_tools/upx-3.96-amd64_linux
      chmod +x ~/my_tools/upx
   fi
fi 

git config --global core.editor nvim
git config --global user.name "Philip Kristoffersen"
git config --global user.email "philipkristoffersen@gmail.com"
git config --global credential.helper store

#Font
if hash yay &> /dev/null
then
   sudo yay -S --needed nerd-fonts-source-code-pro
else
   sudo mkdir /usr/share/fonts/ttf/
   sudo mkdir /usr/share/fonts/ttf/SauceCodeProNerdFont/

   sudo curl https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf --output "/usr/share/fonts/ttf/SauceCodeProNerdFont/Regular.ttf"
   sudo curl https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Bold/complete/Sauce%20Code%20Pro%20Bold%20Nerd%20Font%20Complete.tt --output "/usr/share/fonts/ttf/SauceCodeProNerdFont/Bold.ttf"
   sudo fc-cache
fi

#fix copy paste in neovim
#if hash pacman &> /dev/null
#then
#   sudo pacman -S --needed xsel
#fi

if hash pacman &> /dev/null
then
   sudo pacman -S --needed pamixer playerctl nvidia-settings xsel 
fi

#Fix time when dual booting
timedatectl set-local-rtc 1

if [ ! -d "/home/philip/src/i3blocks-contrib" ]
then
mkdir ~/src/
git clone https://github.com/vivien/i3blocks-contrib ~/src/i3blocks-contrib
fi


sudo ln -sf scripts/stillestille.sh /lib/systemd/system-sleep/stillestille.sh


nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
