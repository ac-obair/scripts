### setup

This is an on going work in progress, I've been setting up my mac and as I do just adding things in here until I consider it complete

#### bootstrap.sh

todo

#### zsh

todo

#### (bash) zsh-completions

**Note** I'm using zsh-completions and not bash-completions I will be keeping the `.zshrc` file in this repo uptodate. 

`git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions`

Enable it in your .zshrc by adding it to your plugin list and reloading the completion, and note these lines are inplace within the `zshrc` given

```
plugins=(… zsh-completions)
autoload -U compinit && compinit
```

#### htop

Install my preferred htop layout

`cp <thisrepo>/htoprc ~/.config/htop/`

