#!/bin/bash

# Homebrew 설치
echo "Homebrew 설치중"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Homebrew 경로 설정
echo "Homebrew 경로 설정"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew 패키지 설치 목록
declare -a cask_apps=(
    "karabiner-elements"
    "jetbrains-toolbox"
    "iterm2"
    "notion"
    "itsycal"
    "scroll-reverser"
    "appcleaner"
    "chatgpt"
    "sublime-text"
)

echo "Installing GUI applications using Homebrew Cask..."
for app in "${cask_apps[@]}"; do
    echo "Installing $app..."
    brew install --cask "$app"
    if [ $? -ne 0 ]; then
        echo "Failed to install $app. Skipping..."
    fi
done

# itsycal 설정 안내 출력
echo "Setting up Itsycal preferences:"
echo "1. Configure the date format to 'MMM d일 (E) a h:mm'."
echo "2. Hide the icon."
echo "3. Go to System Preferences > Control Center > Clock and set it to Analog."

# 설치 완료 메시지
echo "설치 완료. 하나하나 켜보길 바람."
