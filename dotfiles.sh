#!/bin/bash


DOTFILE_DIR="$HOME/dotfilez/"
CONFIG_DIR="$HOME/.config/"
ALACRITTY_DIR="alacritty/"
YABAI_DIR="yabai/"
SKHD_DIR="skhd/"
NVIM_DIR="nvim/"
# NVIM_LUA_DIR="nvim/lua/"
# LUA_SNIP_DIR="nvim/luasnippets/"
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

# [config_dir][dir][filename]
copy_file() {
  SRC_DIR=${1}${2}${3}
  TARGET_DIR=$DOTFILE_DIR${2}${3}
  cecho "NC" "Copying $SRC_DIR to $TARGET_DIR"
  if cp $SRC_DIR $TARGET_DIR; then
    cecho "GREEN" "Succesfully moved!"
  else
    if mkdir -p $TARGET_DIR && cp -R $SRC_DIR $TARGET_DIR; then
      cecho "GREEN" "Succesfully moved!"
    else
      cecho "RED" "Failed to move ${SRC_DIR} to $TARGET_DIR"
    fi
  fi
}

start() {
  copy_file $CONFIG_DIR $ALACRITTY_DIR
  copy_file $CONFIG_DIR $YABAI_DIR "yabairc"
  copy_file $CONFIG_DIR $SKHD_DIR "skhdrc"
  copy_file $CONFIG_DIR $NVIM_DIR
  # copy_file $CONFIG_DIR $LUA_SNIP_DIR 
  copy_file $TMUX_DIR ".tmux.conf"
  copy_file $CONFIG_DIR "starship.toml"
  copy_file $HOME/ ".zshrc"
  copy_file $CONFIG_DIR $LF_DIR
}

start
