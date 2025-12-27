#!/bin/env bash
update() {
  git submodule update --init
  git pull
}
sync() {
  mkdir -p dirty; rm -r dirty/*
  echo "Copying to 'dirty/'"
  cp -r uPurple/* dirty/
}
echo "Use this to fix build lmao, everytime you do update uPurple, u gotta run this lol"

usage() {
  echo "Usage: $0 <Command>"
  echo "update|U:    Sync submodule with 'dirty hack' folder"
  echo "  help|H:    Show this"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
  update)
  update
  sync
  ;;
  sync)
  sync
  ;;
  help|--help)
  usage; exit 0
  ;;
  *)
  echo "Unknown option: $1"
  usage
  exit 1
  ;;
  esac
  shift 1  # Move to the next argument
done

