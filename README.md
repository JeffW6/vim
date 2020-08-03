# Vim Config

## vimrc config.

### Installation

- Install [vim-plug](https://github.com/junegunn/vim-plug) first.
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- Download directly.
```
# Download vimrc.
wget https://raw.githubusercontent.com/JeffW6/vim/master/vimrc

# if ~/.vimrc file isn't exist.
mv vimrc ~/.vimrc
```

If you can't connect raw.githubusercontent.com, please modify this file:
```
sudo vim /etc/hosts
```
Add the following line to the this file.
```
199.232.68.133 raw.githubusercontent.com
```
It works.

- Alternatively clone the repo.
```
cd ~/.vim
git clone https://github.com/jeffw6/vim.git

# Edit ~/.vimrc, and add this:
so ~/.vim/vim/vimrc
```
