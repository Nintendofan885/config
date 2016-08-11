# config

### Prerequisites

* Clone this repo to `~/git/config`
* Install `xcode`

### Usage

To set up everything from scratch, run the following:

```
cd ~/git/config/utils
./do_everything.sh
```

To periodically update homebrew, run this from the terminal:

```
homebrew_me_harder
```

### Notes

* **Danger:** this will remove your current `~/.bash_profile`, `~/.vimrc`, and `~/.ssh/config`
* ssh keys need to be placed in `~/.ssh`
* `~/.github_tokens.sh` will need to be updated
* `~/.virtualenvs` will be the location for Python virtualenvs
