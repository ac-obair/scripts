
## Keychain Automation

This works on linux and mac

#### Keychain

Keychain is an excellent tool for automatic remote ssh sessions. It is a wrapper for ssh-add and keeps your encrypted keys in memory for the life time of the uptime of a system. If the system is rebooted however you must reenter all your passwords for all your keys, as the profile file for that shell is sourced. This is fine but doesn't scale. If you have over 10 or 20 deploty keys you will have to enter the password for each. 

####  The problem

This repo provides a way to completely automate loading keychain managed ssh keys into memory when a shell session is first started without having to enter your password by usinga linux `expect` script. This means when you start a shell the passwords are loaded by `keychain` a wrapper for `ssh-add` and then as long as the environment variable `KEY_PASSWORD` exists in your shell it will be provded to ssh-add and the keys loaded into memory.

#### How it works

The manual way to load keys via `keychain` into memorty is by statements into your `~/.bash_profile` or `~/.zshrc` file depending on your shell. *Note* also that keychain requires additional files to be sourced to function properly and those **are** included in the provide file ``. 

```
keychain ~/.ssh/<key_one_rsa>
keychain ~/.ssh/<key_two_rsa>
keychain ~/.ssh/<key_three_rsa>
```

After each statement is evaluated a password prompt is given the first time where you would enter the password for each key. They can become tedious if you're managing deploy keys and have over 10 of them. 

#### What this repo provides

Once keychain is installed and working properly simply ensure that these lines are in your shells environment script.

```
export KEY_PASSWORD=<the password of your rsa keys>
<path/to/my>/pull_key_passwords.exp
```

#### Example usage

This is an example of how to managfe deploy keys, and take advantage of reading our passowrds in dynamically from the environment adding a new repo or deploy key to the system. This way you will never have to enter the password as long as it is sourced from the same profile file. 


*~/.ssh/confg*

We create a local hsot resolver that points to the correct host

```
Host scripts.github.com
 Hostname github.com
 User git
 IdentityFile ~/.ssh/<key_one_rsa>
 IdentitiesOnly yes
```

*<path/to>/repo/.git/config*

We make our push url unqie using local host resolution

```
[remote "origin"]
	url = git@scripts.github.com:ac-obair/scripts.git
```

*pull_key_passwords.exp*

We simple add the key file to the list in the expect loop.

```
foreach rsa { "key_one_rsa"
              "key_two_rsa"
              "key_three_rsa"
 } {
  spawn keychain $path/$rsa
  expect "Enter " { send "$password\r" }
}
```
