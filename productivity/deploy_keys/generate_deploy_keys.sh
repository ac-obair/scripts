#!/bin/bash

repo=$1

# generate a new key by name of the repo it's mean to be deployed to
if [ -Z $repo ]; then
 	read -rp "pass a repo for the key you're about to generate _rsa will be appended for you: " repo 
 	ssh-keygen -f ~/.ssh/${repo}_rsa -t rsa -b 4096 -N $(echo $VAULT_PASSWORD)
 else
	ssh-keygen -f ~/.ssh/${repo}_rsa -t rsa -b 4096 -N  $(echo $VAULT_PASSWORD)
 fi

# ensure repo is reachable by obfuscated Host name 
sed -e 's/github.com/${repo}.github.com/' $HOME/Devops/$repo/.git/config

# load key to keychain
cat >> ~/.zshrc <<END
keychain ~/.ssh/${repo}_rsa
END

# add host 
cat >> ~/.ssh/config <<END

Host ${repo}.github.com
 Hostname github.com
 User git
 IdentityFile ~/.ssh/${repo}_rsa
 IdentitiesOnly yes
END

echo
echo "you're public key is: "
cat ~/.ssh/${repo}_rsa.pub
echo "copy this to the deploy keys section of your repo"
