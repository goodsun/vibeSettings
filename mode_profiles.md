# Mode Profiles Configuration

## 使い方
1. 使用したいプロファイル名を ACTIVE_PROFILE に設定
2. Claudeはそのプロファイルに含まれる設定ファイルのみを読み込みます

## ACTIVE_PROFILE: current_settings
## SPEED_MODE: cautious  # fast or cautious

## PROFILES

### current_settings
- configs/english_learning.md
- configs/development.md
- configs/interactive_mode.md
- configs/system_analysis.md
- configs/talk_settings.md
- configs/strict_rules.md

### default
- configs/development.md
- configs/english_learning.md
- configs/strict_rules.md

### development_only
- configs/development.md
- configs/system_analysis.md
- configs/strict_rules.md

### learning_focus
- configs/english_learning.md
- configs/talk_settings.md
- configs/interactive_mode.md

### minimal
- configs/strict_rules.md

### full
- configs/development.md
- configs/documentation.md
- configs/english_learning.md
- configs/interactive_mode.md
- configs/progress_management.md
- configs/strict_rules.md
- configs/system_analysis.md
- configs/talk_settings.md
