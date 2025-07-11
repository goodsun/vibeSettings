# vibeSettings セットアップガイド

## 初回セットアップ

```bash
# サンプルファイルから設定ファイルを作成
cp samples/mode_profiles.md.sample mode_profiles.md

# 必要に応じて編集
vim mode_profiles.md
```

## 設定の変更方法

### プロファイルの切り替え
`mode_profiles.md`の`ACTIVE_PROFILE`行を編集：
```
## ACTIVE_PROFILE: development_only
```

### 速度モードの切り替え
`mode_profiles.md`の`SPEED_MODE`行を編集：
```
## SPEED_MODE: fast  # fast or cautious
```

## ファイル構成

- `mode_profiles.md.sample` - サンプル設定（Git管理）
- `mode_profiles.md` - 実際の設定（.gitignore）
- `configs/` - 各種動作設定（Git管理）