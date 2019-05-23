#!/usr/bin/env bash

dotfiles_install_brew() {
    # echo "Checking if 'brew' is already installed..."
    if [[ ! -e /usr/local/bin/brew ]]; then
        echo "Installing 'brew'..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "'brew' is already install... skipping"
        return 0
    fi
}

dotfiles_install_asdf() {
    # echo "Checking if 'asdf' is already installed..."
    if [[ ! -d ~/.asdf ]]; then
        echo "Installing 'asdf'..."
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.1
    else
        echo "'asdf' is already install... skipping"
        return 0
    fi
}

dotfiles_install_zplugin() {
    # echo "Checking if 'zplugin' is already installed..."
    if [[ ! -d ~/.zplugin ]]; then
        echo "Installing 'zplugin'..."
        git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin
    else
        echo "'zplugin' is already install... skipping"
        return 0
    fi
}

dotfiles_set_default_shell_zsh() {
    if [[ "$SHELL" != "/bin/zsh" ]]; then
        echo "Changing default shell to zsh... (password may require)"
        chsh -s /bin/zsh
    else return 0; fi
}

dotfiles_install_asdf_plugins() {
    _dotfiles_install_asdf_plugins golang 1.12.5
    _dotfiles_install_asdf_plugins helm 2.13.1
    _dotfiles_install_asdf_plugins kops 1.11.1
    _dotfiles_install_asdf_plugins kubectl 1.14.2
    _dotfiles_install_asdf_plugins nodejs 10.15.3
    _dotfiles_install_asdf_plugins python 3.6.8 with-system-version-fallback
    _dotfiles_install_asdf_plugins ruby 2.6.3 with-system-version-fallback
    _dotfiles_install_asdf_plugins terraform 0.11.14
    _dotfiles_install_asdf_plugins vault 1.1.2
}

_dotfiles_install_asdf_plugins() {
    echo "Installing $1 v.$2"

    declare -a installed=($(asdf list $1))
    if [[ "$installed" =~ "$2" ]]; then
        echo "$1 v.$2 is already installed"
        return 0
    else
        asdf install $1 $2
    fi

    if [[ "$installed" =~ "$2" ]]; then
        echo "$1 v.$2 is already installed"
        return 0
    else
        if [[ $1 == "nodejs" && -f ~/.asdf/plugins/nodejs/bin/import-release-team-keyring ]]; then
            echo "Import the Node.js release team's OpenPGP keys to main keyring"
            bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
        fi

        asdf install $1 $2
    fi

    if [[ $3 == "with-system-version-fallback" ]]; then
        asdf global $1 $2 system
    else
        asdf global $1 $2
    fi
}
