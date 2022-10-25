#!/bin/bash


DOTFILE_DIR="$HOME/dotfilez/"
CONFIG_DIR="$HOME/.config/"
ALACRITTY_DIR="alacritty/"
YABAI_DIR="yabai/"
SKHD_DIR="skhd/"
NVIM_DIR="nvim/"
TMUX_DIR="$HOME/"
LF_DIR="lf/"

cecho(){
  RED="\033[0;31m"
  GREEN="\033[0;32m"  # <-- [0 means not bold
  YELLOW="\033[1;33m" # <-- [1 means bold
  CYAN="\033[1;36m"

  NC="\033[0m" # No Color

  printf "${!1}${2} ${NC}\n" # <-- bash
}

copy_dir() {
  SRC_DIR=$1$2
  TARGET_DIR=$DOTFILE_DIR$2
  if mkdir -p $TARGET_DIR && cp -R $SRC_DIR $TARGET_DIR; then
    cecho "NC" "Created $TARGET_DIR"
    cecho "GREEN" "Moved $SRC_DIR to $TARGET_DIR"
  else
    cecho "RED" "Failed to move $SRC_DIR to $TARGET_DIR"
  fi
}

# [config_dir][dir][filename]
copy_file() {
  SRC_DIR=$1$2
  TARGET_DIR=$DOTFILE_DIR$2
  FILE_NAME=$3
  if [[ -f $SRC_DIR$FILE_NAME ]]; then
    if mkdir -p $TARGET_DIR && cp $SRC_DIR$FILE_NAME $TARGET_DIR$FILE_NAME; then
      cecho "GREEN" "Successfully moved file $FILE_NAME to $TARGET_DIR";
    else
      cecho "RED" "Unable to move file $FILE_NAME to $TARGET_DIR"
    fi
  fi
}

start() {
  copy_dir $CONFIG_DIR $ALACRITTY_DIR
  copy_dir $CONFIG_DIR $NVIM_DIR
  copy_dir $CONFIG_DIR $LF_DIR
  copy_file $CONFIG_DIR $YABAI_DIR "yabairc"
  copy_file $CONFIG_DIR $SKHD_DIR "skhdrc"
  copy_file $TMUX_DIR "" ".tmux.conf"
  copy_file $CONFIG_DIR "" "starship.toml"
  copy_file $TMUX_DIR "" ".zshrc"
}

start
