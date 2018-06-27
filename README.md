asdf# environment\_configuration

This repository collects a wide variety of customizations that I use to customize my terminal emulators. It also includes a number of setup scripts designed to bootstrap either a Mac- or Linux- type operation system as it is somewhat tedious to go through the entire process each time I end up using a different machine.

Customizations include:
* readline settings
* terminal-appearance
* bash
* vim

## Setup Steps

Clone the repo. For best results, perform `git clone` in the `~` directory.

```shell
cd ~
git clone git@github.com:b7campbell/environment_configuration
```

### readline setup

Add customizations for readline. Because most systems do not have an `~/.inputrc` by default, the script creates a symlink.

```shell
cd environment_configuration/scripts
./readline-setup.sh
```

### terminal-colors setup

This step requires some manual setup. The script will prompt where necessary.

```shell
cd environment_configuration/scripts
./terminal-colors-setup.sh
```

### vim setup

If there is no preexisting `~/.vimrc`, this step is fully automated. Otherwise, there will be a conflict relating to how `runcoms/vimrc` gets added into the vim runtime environment. The script will provide guildelines.

```shell
cd environment_configuration/scripts
./vim_setup.sh
```

### activate the repo

```sh
echo '. ~/environment_configuration/setup.sh' >> ~/.bashrc
. ~/.bashrc
```

`.bashrc` will now setup an interactive shell according to the specs outlined in this repo.


### extras

This script is responsible for minimal ssh configuration, namely the addition of the csil hostname.

```shell
./envrionment_configuration/scripts/ssh-config-setup.sh
```


