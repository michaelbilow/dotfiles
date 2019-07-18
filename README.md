# My setup script

This is designed to short-circuit the process of setting up a 
fresh Ubuntu 18.04 box or Mac more-or-less the way I (the author) like it.

## Installation

The bootstrap script installs `curl`, but generally I'll install it first;
otherwise I'll download the file using Firefox if it's installed.

The `bootstrap.sh` file is available at:
- https://raw.githubusercontent.com/michaelbilow/dotfiles/master/bootstrap.sh
- https://git.io/fjXzb
- http://bit.ly/bilow1804

Personally I find the bitly link easier to remember, so:

```bash
$ apt-get update && apt-get install -y curl sudo
$ curl -L bit.ly/bilow1804 > bootstrap.sh
$ sudo bash bootstrap.sh
```

## What does it install?


- Tools I consider essential
  - `jq`, `vim`, `magic-wormhole`, `tmux`
- Programming Languages that I need:
  -  `sbt`, `nodejs`, OpenJDK Java 8, `conda`
- Tools that are essential that I forget to install the first time I boot up a new machine.
  - `gnupg`, `dkms`, etc.
- Tools that are a huge pain to install
  - `cuda` (10.0)
- Passwordless `ssh` from another machine
- System startup scripts
- An up-to-date `base` conda environment
- A daily-driver `work` conda environment with:
  - Jupyterlab, the scipy stack, dask, fiona, shapely, cookiecutter, a number of jupyter labextensions, chartify, altair, pyarrow, boto3, etc.
- A `tensorflow` conda environment
- Bash aliases
- Git completion and git prompt
- The `aws` CLI
- [`ni`](https://github.com/spencertipping/ni)

## What should I do with this?

Try it out on a fresh install! Fork this an make a PR; I'd love to be able 
to set up more than Mac and Ubuntu, but this is all experimental for now.
