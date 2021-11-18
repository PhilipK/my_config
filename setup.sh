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
ln -sf ${CUR_LOCATION}scripts/mouse_center ~/my_tools/mouse_center 
ln -sf ${CUR_LOCATION}rofi ~/.config/rofi
ln -sf ${CUR_LOCATION}scripts/messages ~/my_tools/messages
ln -sf ${CUR_LOCATION}xorg/xinitrc ~/.xinitrc

sudo ln -sf ${CUR_LOCATION}picom/picom.conf /etc/xdg/picom.conf
mkdir -p ~/my_tools/



sudo pacman --needed -Syu
#Pacman
sudo pacman --needed -S neovim \
   alacritty \
   xorg \
   xorg-xinit \
   neofetch \
   upx \
   git \
   tldr \
   fakeroot \
   base-devel \
   pamixer \
   playerctl \
   pipewire \
   xsel \
   rofi \
   xdotool \
   i3blocks \
   i3-gaps \
   lxappearance \
   pamixer \
   acpi \
   python3 \
   picom \
   xorg-xrandr \
   wireless_tools \
   arandr \
   maim \
   pavucontrol \
   chromium \
   nitrogen \
   glances \
   xclip

sudo pacman --needed -S steam 

if [ ! -d "/home/philip/src/NordArc" ]
then
mkdir ~/src/
git clone https://github.com/robertovernina/NordArc ~/src/NordArc
ln -sf  ~/src/NordArc/NordArc-Theme  ~/.themes/NordArc-Theme
ln -sf  ~/src/NordArc/NordArc-Icons  ~/.icons/NordArc-Icons
fi



#YAY

echo "Remember to enable multlib https://wiki.archlinux.org/title/Official_repositories#multilib" 

if [ ! -d "/opt/yay-git" ]
then
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R philip:philip ./yay-git
cd yay-git
makepkg -si

fi

yay  --nocleanmenu --nodiffmenu --noeditmenu --norebuild --needed -S nerd-fonts-source-code-pro \
   visual-studio-code-bin \
   spotify \
   workflowy \
   slack-desktop \
   zoxide \
   ttf-font-awesome

ln -sf /opt/WorkFlowy-x86_64.AppImage ~/my_tools/workflowy


#Fonts
fc-cache 

#Git Config
git config --global core.editor nvim
git config --global user.name "Philip Kristoffersen"
git config --global user.email "philipkristoffersen@gmail.com"
git config --global credential.helper store



#Fix time when dual booting
sudo timedatectl set-local-rtc 1

if [ ! -d "/home/philip/src/i3blocks-contrib" ]
then
mkdir ~/src/
git clone https://github.com/vivien/i3blocks-contrib ~/src/i3blocks-contrib
fi

i



echo "Here some links to visit"
echo "Nord Theme: https://chrome.google.com/webstore/detail/nord/abehfkkfjlplnjadfcjiflnejblfmmpj"

echo "Last Pass : https://chrome.google.com/webstore/detail/lastpass-free-password-ma/hdokiejnpimakedhajhdlcegeplioahd"
echo "Vimium : https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb"
echo "uBlock : https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en"
echo "SponsorBlock : https://chrome.google.com/webstore/detail/sponsorblock-for-youtube/mnjggcdmjocbbbhaepdhchncahnbgone?hl=en"
