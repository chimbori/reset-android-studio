#!/usr/bin/env bash
# Manas Tungare <manas@chimbori.com>

# If any one command fails, immediately exit.
# Treat unset variables as an error, and immediately exit.
set -eu

export LANG=en_US.UTF-8
export TERM=xterm-256color
export CLICOLOR=yes
RED="\033[00;31m"
YELLOW="\033[01;33m"
NORMAL="\033[00m"

trap "echo -e \"\n${RED}Cancelling all operations.${NORMAL}\"; exit;" INT TERM

function message() {
  echo -e "${YELLOW}$1${NORMAL}"
}

echo -e "⚠️  ${YELLOW}This will completely delete all Gradle & Android Studio caches & config, and will require you to re-import the project from scratch.${NORMAL}"
echo -n "Press Enter to confirm, or Ctrl+C to cancel… "
read ignorePressedKey
echo ""

# Check if this script is being run from the correct location.
if [ ! -f "./gradlew" ]; then
  echo -e "${RED}“gradlew” not found at “$(pwd)”${NORMAL}"
  echo "Consider running this script from the root of an Android Studio project."
  echo -n "Press Enter to continue, or Ctrl+C to abort… "
  read ignorePressedKey
  echo ""
fi

# Script begins!
message "Killing ADB…"
adb kill-server
killall adb

message "Cleaning current project, including Gradle & Android Studio caches & config…"
pwd
./gradlew clean
./gradlew cleanBuildCache
./gradlew --stop
find . -iname ".idea" -print -exec rm -Rfv "{}" \;
find . -iname ".gradle" -print -exec rm -Rfv "{}" \;
find . -iname "build" -print -exec rm -Rfv "{}" \;
find . -iname "*.iml" -print -exec rm -Rfv "{}" \;

message "Deleting global state, including Gradle & Android Studio caches & config…"
rm -v ~/Library/Preferences/com.google.android.studio.plist
rm -Rfv ~/Library/Preferences/AndroidStudio*
rm -Rfv ~/Library/Application\ Support/AndroidStudio*
rm -Rfv ~/Library/Logs/AndroidStudio*
rm -Rfv ~/Library/Caches/AndroidStudio*
