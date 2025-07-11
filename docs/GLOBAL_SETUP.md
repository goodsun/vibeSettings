# グローバル設定の適用方法

## 概要
`~/.claude/CLAUDE.md`に設定を記述することで、全てのClaude Codeセッションで共通の設定を適用できます。

## 動作原理
1. **グローバル設定**: `~/.claude/CLAUDE.md`が全セッションで読み込まれる
2. **モード管理**: `~/vibeSettings/configs/mode_setting.md`でモードを制御
3. **設定ファイル**: ONのモードに対応する設定ファイルが適用される

## 利用方法

### 1. 初回セットアップ
```bash
# 設定ファイルをコピー
cp ~/vibeSettings/samples/mode_setting.md.sample ~/vibeSettings/configs/mode_setting.md
```

### 2. モード調整
`~/vibeSettings/configs/mode_setting.md`を編集して、必要なモードをONに設定

### 3. 確認
任意のディレクトリで`claude`を起動すると、設定が適用されます

## メリット
- **統一性**: 全プロジェクトで一貫した設定
- **効率性**: プロジェクト毎の設定ファイル作成が不要
- **カスタマイズ**: モード切り替えで柔軟な設定変更

## 注意点
- `mode_setting.md`が存在しない場合は、sampleファイルをコピーする必要があります
- 個別プロジェクトに`CLAUDE.md`がある場合は、そちらが優先されます
- `mode_setting.md`はgitignoreされているため、個人設定として管理されます

## 設定の優先順位
1. **プロジェクト固有の`CLAUDE.md`**（最優先）
2. **グローバル設定`~/.claude/CLAUDE.md`**
3. **デフォルト設定**

これにより、プロジェクト毎のカスタマイズも可能です。
