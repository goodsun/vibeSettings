# プロジェクト別設定ガイド

このドキュメントでは、プロジェクトごとに最適なAIアシスタント設定を使い分ける方法を説明します。

## 📋 目次

1. [設定方法の概要](#設定方法の概要)
2. [方法1: プロファイル切り替え](#方法1-プロファイル切り替え)
3. [方法2: プロジェクト専用設定](#方法2-プロジェクト専用設定)
4. [方法3: カスタムプロファイル](#方法3-カスタムプロファイル)
5. [使用例](#使用例)
6. [ベストプラクティス](#ベストプラクティス)

## 設定方法の概要

| 方法 | 利点 | 適した用途 |
|------|------|-----------|
| プロファイル切り替え | 簡単・高速 | 一時的な作業 |
| プロジェクト専用設定 | 完全に独立 | 長期プロジェクト |
| カスタムプロファイル | 再利用可能 | 定期的な作業 |

## 方法1: プロファイル切り替え

### 手順
```bash
# 1. 設定ファイルを編集
vim ~/vibeSettings/mode_profiles.md

# 2. ACTIVE_PROFILEを変更
## ACTIVE_PROFILE: development_only  # ← ここを変更

# 3. AIアシスタントを再起動（必要な場合）
```

### 利用可能なプロファイル

#### development_only
```
- 開発モード ✅
- システム解析 ✅
- 厳守ルール ✅
- 英語学習 ❌
- 対話設定 ❌
```
**用途**: 集中的なコーディング作業

#### minimal
```
- 厳守ルール ✅
- その他すべて ❌
```
**用途**: 最速レスポンスが必要な場合

#### learning_focus
```
- 英語学習 ✅
- 対話設定 ✅
- インタラクティブ ✅
```
**用途**: 学習や企画立案

## 方法2: プロジェクト専用設定

### 基本設定
```bash
# プロジェクトディレクトリに移動
cd ~/my-awesome-project

# AI設定ディレクトリを作成します（Claudeの場合: .claude）
mkdir -p .claude

# プロジェクト専用のAI設定ファイルを作成（Claudeの場合: CLAUDE.md）
cat > .claude/CLAUDE.md << 'EOF'
# Project: My Awesome Project

## プロジェクト概要
このプロジェクトはReactとTypeScriptを使用したWebアプリケーションです。

## 開発ルール
- TypeScriptの型定義を厳密に行う
- React Hooksを優先的に使用
- テストファイルは必ず作成

## 無視する設定
- 英語学習モードは使用しない
- 対話的な確認は最小限に
EOF
```

### 高度な設定例

#### Webアプリプロジェクト
```markdown
# Web Application Project

## 技術スタック
- Frontend: React 18, TypeScript, Tailwind CSS
- Backend: Node.js, Express, PostgreSQL
- Testing: Jest, React Testing Library

## コーディング規約
- コンポーネントは関数型で記述
- カスタムフックは `use` プレフィックス
- APIレスポンスは必ず型定義

## 自動実行コマンド
- コミット前: `npm run lint && npm test`
- ビルド確認: `npm run build`
```

#### 機械学習プロジェクト
```markdown
# ML Project Configuration

## 環境
- Python 3.10+
- 主要ライブラリ: torch, numpy, pandas, scikit-learn

## 開発フロー
1. データ探索は Jupyter Notebook で
2. 本番コードは .py ファイルに整理
3. 実験結果は experiments/ に記録

## 注意事項
- GPUメモリを考慮したバッチサイズ設定
- 再現性のため乱数シードを固定
```

## 方法3: カスタムプロファイル

### 新規プロファイルの作成
```bash
# mode_profiles.mdを編集
vim ~/vibeSettings/mode_profiles.md
```

```markdown
### react_project
# React開発に特化した設定
- configs/development.md
- configs/strict_rules.md
- configs/system_analysis.md

### data_analysis
# データ分析用の設定
- configs/development.md
- configs/documentation.md
- configs/progress_management.md

### api_development
# API開発用の設定
- configs/development.md
- configs/system_analysis.md
- configs/documentation.md
```

## 使用例

### シナリオ1: 新規Reactプロジェクトの開始
```bash
# 1. プロジェクトディレクトリを作成
mkdir ~/react-todo-app
cd ~/react-todo-app

# 2. プロジェクト専用設定を作成
mkdir .claude
echo "React TODOアプリ開発用設定" > .claude/CLAUDE.md

# 3. プロファイルを切り替え
# ~/vibeSettings/mode_profiles.md で
# ACTIVE_PROFILE: react_project に変更

# 4. AIアシスタントを起動（Claudeの場合: claudeコマンド）
claude
```

### シナリオ2: 既存プロジェクトでの作業
```bash
# 1. プロジェクトディレクトリに移動
cd ~/existing-project

# 2. 速度優先で作業したい場合
# ACTIVE_PROFILE: minimal
# SPEED_MODE: fast

# 3. バグ修正などの慎重な作業
# ACTIVE_PROFILE: development_only
# SPEED_MODE: cautious
```

### シナリオ3: 複数プロジェクトの切り替え
```bash
# プロジェクトA（Web開発）
cd ~/project-a
# ACTIVE_PROFILE: react_project

# プロジェクトB（データ分析）
cd ~/project-b  
# ACTIVE_PROFILE: data_analysis

# プロジェクトC（API開発）
cd ~/project-c
# ACTIVE_PROFILE: api_development
```

## ベストプラクティス

### 1. プロファイル命名規則
```
- 用途別: development_only, learning_focus
- 技術別: react_project, python_ml
- 段階別: planning_phase, implementation_phase
```

### 2. 設定の優先順位
```
1. プロジェクトローカル設定 (.claude/CLAUDE.md)
2. グローバルプロファイル (mode_profiles.md)
3. デフォルト設定
```

### 3. チーム開発での活用
```bash
# チーム共通設定をGit管理します（Claudeの場合の例）
git add .claude/CLAUDE.md
git commit -m "Add project-specific AI assistant settings"

# 個人設定は.gitignoreで除外
echo ".claude/CLAUDE.local.md" >> .gitignore
```

### 4. パフォーマンス最適化
- **開発時**: 不要なモードをOFFにして高速化
- **レビュー時**: documentation.mdをONにして詳細な説明
- **デバッグ時**: system_analysis.mdをONにして徹底分析

## トラブルシューティング

### Q: 設定が反映されない
A: AIアシスタントを再起動するか、新しいセッションを開始してください。

### Q: どのプロファイルを使えばいいか分からない
A: まずは `default` プロファイルから始めて、必要に応じて調整してください。

### Q: プロジェクト設定とグローバル設定が競合する
A: プロジェクトローカル設定が優先されます。明示的に記載してください。

## 関連ドキュメント

- [README.md](../README.md) - 基本的な使い方
- [SETUP.md](../SETUP.md) - 初期設定ガイド
- [設定ファイルの書き方](../configs/README.md) - 設定ファイルのフォーマット