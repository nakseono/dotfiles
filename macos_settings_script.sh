#!/bin/bash

# 배터리 설정 (맥북 전용)
if [[ $(system_profiler SPHardwareDataType | grep "Model Identifier") == *"MacBook"* ]]; then
    echo "맥북 배터리 설정"
    # 디스플레이가 꺼져 있을 때 전원 어댑터 사용 시 컴퓨터를 자동으로 잠자지 않게 하기
    sudo pmset -c sleep 0
    # 네트워크 연결 시 깨우기 OFF
    sudo pmset -a womp 0
else
    echo "맥북이 아니기에 배터리 관련 설정 스킵"
fi

# Dock 설정
echo "독 설정중"
# 크기 줄이기 및 자동으로 Dock 가리기와 보기 ON
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock autohide -bool true
# Dock에서 제안된 앱 및 최근 앱 보기 OFF
defaults write com.apple.dock show-recents -bool false
# 자동 숨기기 지연 없이 사용하기
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
killall Dock

# 핫 코너 설정 (우측 하단 데스크탑)
echo "핫 코너 설정"
defaults write com.apple.dock wvous-br-corner -int 4 # Desktop
defaults write com.apple.dock wvous-br-modifier -int 0
killall Dock

# 손쉬운 사용 > 포인터 제어 설정
echo "손쉬운 사용 설정"
# 트랙패드 드래그 스타일 설정 (세 손가락 드래그)
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
defaults write com.apple.AppleMultitouchTrackpad DraggingStyle -string "threeFingerDrag"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DraggingStyle -string "threeFingerDrag"
killall SystemUIServer

# 제어 센터 설정
# 배터리 퍼센트 보기
echo "제어 센터 설정"
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
killall SystemUIServer

# 잠금 화면 설정
# 화면 보호기 시작 후 또는 디스플레이가 꺼진 후 암호 요구 (즉시)
echo "잠금 화면 설정"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
killall SystemUIServer

# 키보드 설정
# 키 반복 속도 및 반복 지연 시간 설정
echo "키보드 설정"
defaults write -g KeyRepeat -int 1 # 제일 빠르게
defaults write -g InitialKeyRepeat -int 10 # 제일 짧게
killall SystemUIServer

echo "모든 설정 완료, 재시작이 필요할 수 있음."
