#!/bin/bash

FOLDER_COUNT=$(ls -d */ | cut -f1 -d '/' | wc -l)
FOLDER=$(ls -d */ | cut -f1 -d '/')

REQUIRED_FOLDER="terminal-hero"
CURRENT_FOLDER=${PWD##*/}
if [ "$CURRENT_FOLDER" != "$REQUIRED_FOLDER" ]
then
  echo "❌ Your folder has the wrong name, it should be \"terminal-hero\""
  exit 1
fi

if [ $FOLDER_COUNT != "1" ]
then
  echo "❌ There is more than 1 subfolder in the terminal-hero folder"
  exit 1
fi

FILE=$FOLDER"/hero.md"

if [ ! -f  "$FILE" ]
then
  echo "❌ The hero.md file is not includes in the folder that should have your first name"
  exit 1
fi

if [ -f  "test.md" ]
then
  echo "❌ You did not delete the test.md file"
  exit 1
fi

REQUIRED_TEXT='hero of the terminal'
HERO_TEXT=$(cat $FOLDER/hero.md)

if [ "$HERO_TEXT" != "$REQUIRED_TEXT" ]
then
  echo "❌ The text of hero.md in your first name folder is not \"hero of the terminal\""
  exit 1
fi

echo '🎉' $FOLDER 'is a' $HERO_TEXT '🎉'
