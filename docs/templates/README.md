# テンプレート一覧

プロジェクト用途に応じて最適なテンプレートを選択できます。

## 📁 カテゴリ別テンプレート

### basic/ - 基本テンプレート
**初心者向け・汎用的なプロジェクト**

| テンプレート | 用途 | 推奨レベル |
|-------------|------|-----------|
| `basic.md` | 一般的なプロジェクト | 初心者 ⭐ |
| `sample.md` | テンプレートのサンプル | 初心者 ⭐ |
| `toplevel.md` | 大規模プロジェクト | 中級者 ⭐⭐ |

### web/ - Web開発
**Webアプリケーション・モバイルアプリ**

| テンプレート | 用途 | 推奨レベル |
|-------------|------|-----------|
| `webapp.md` | Webアプリケーション | 中級者 ⭐⭐ |
| `mobile-app.md` | モバイルアプリ | 中級者 ⭐⭐ |

### specialized/ - 技術特化
**特定技術スタックに特化**

| テンプレート | 用途 | 推奨レベル |
|-------------|------|-----------|
| `machine-learning.md` | 機械学習プロジェクト | 上級者 ⭐⭐⭐ |
| `microservices.md` | マイクロサービス | 上級者 ⭐⭐⭐ |
| `web3cdk.md` | Web3/ブロックチェーン | 上級者 ⭐⭐⭐ |

### workflow/ - プロセス重視
**開発プロセス・ワークフローに特化**

| テンプレート | 用途 | 推奨レベル |
|-------------|------|-----------|
| `develop.md` | 開発プロセス重視 | 中級者 ⭐⭐ |
| `project_kickoff.md` | プロジェクト立ち上げ | 初心者 ⭐ |
| `interactive_project_planning.md` | 対話的企画 | 中級者 ⭐⭐ |

### special/ - 特殊用途
**特定用途に特化**

| テンプレート | 用途 | 推奨レベル |
|-------------|------|-----------|
| `english_learning.md` | 英語学習プロジェクト | 初心者 ⭐ |

## 🚀 テンプレートの選び方

### 1. レベル別推奨
- **初心者**: `basic/basic.md` から開始
- **中級者**: 用途に応じて `web/` や `workflow/` を選択
- **上級者**: `specialized/` から最適なものを選択

### 2. プロジェクト種類別
```
Webサイト作成     → web/webapp.md
スマホアプリ      → web/mobile-app.md
AI/ML プロジェクト → specialized/machine-learning.md
新規事業企画      → workflow/interactive_project_planning.md
学習プロジェクト   → special/english_learning.md
その他           → basic/basic.md
```

### 3. チーム規模別
- **個人開発**: `basic/basic.md`
- **小チーム**: `workflow/project_kickoff.md`
- **大規模チーム**: `specialized/microservices.md`

## 📝 使用方法

### 基本的な流れ
```bash
# 1. テンプレートをコピー（Claudeの場合の例）
cp docs/templates/basic/basic.md .claude/CLAUDE.md

# 2. プロジェクトに合わせて編集
vim .claude/CLAUDE.md

# 3. AIアシスタントを起動（Claudeの場合: claudeコマンド）
claude
```

### カスタマイズのコツ
1. **技術スタック**を明記
2. **コーディング規約**を具体的に
3. **プロジェクト固有のルール**を追加
4. **不要な部分は削除**

## 🔄 テンプレートの更新

新しいテンプレートの提案や既存テンプレートの改善案があれば、プルリクエストをお送りください。

## 関連ドキュメント

- [PROJECT_SETUP.md](../PROJECT_SETUP.md) - プロジェクト別設定の詳細
- [CLAUDE_TIPS.md](../CLAUDE_TIPS.md) - Claude活用のコツ（Claude用）
- [mode_profiles.md.sample](../../samples/mode_profiles.md.sample) - プロファイル設定