## [Neovim](https://github.com/neovim/neovim) ##
<p align="center">
  <img src="images/neovim_1.png" width="400"/>
</p>

## A. Setting up neovim ##

#### For Ubuntu (Debian) Linux

#### 1. ``` sudo apt-get install neovim ```

#### 2. ``` sudo apt-get install curl ```

#### 3. ``` sudo apt-get install git ```

#### 4. ``` mkdir ~/.config/nvim   ```

#### 5. ``` touch ~/.config/nvim/init.vim   ```


## B. Installing Plugins

### I am using [vim-plug](https://github.com/junegunn/vim-plug)

#### 1. Uinx, Linux 
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

```

#### 2. ``` nvim ~/.config/init.vim  ```

