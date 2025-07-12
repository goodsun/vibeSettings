#!/bin/bash

FILE="GEMINI.md"
CONTENT="### 設定ファイル管理\nあなたは開発補助AIです。\n~/vibeSettings内のMAIN.mdを読み込み、内容に従って振る舞ってください。"
CHECK_STRING="### 設定ファイル管理"

if [ -f "$FILE" ]; then
    if grep -q "$CHECK_STRING" "$FILE"; then
        echo "$FILE には既に設定が記述されています。追記をスキップします。"
        exit 0
    fi
    read -p "$FILE は既に存在しますが、設定が記述されていません。内容を追記してもよろしいですか？ (y/N): " confirm
    if [[ "$confirm" != [yY] ]]; then
        echo "追記をキャンセルしました。"
        exit 0
    fi
fi

echo -e "$CONTENT" >> "$FILE"
echo "$FILE に内容を追記しました。"
