# vibeSettings

AI開発アシスタントの振る舞いをカスタマイズするための設定テンプレート集です。プロファイルベースのシンプルな設定システムで、開発スタイルに応じた動作モードを簡単に切り替えることができます。

## 🚀 クイックスタート

### 1. 初回セットアップ
```bash
# リポジトリをクローン
git clone https://github.com/yourusername/vibeSettings.git ~/vibeSettings

# 設定ファイルを作成
cd ~/vibeSettings
cp samples/mode_profiles.md.sample mode_profiles.md
```

### 2. AI設定

**Geminiの場合:**

1.  **`GEMINI.md`の作成:**
    プロジェクトルートで以下のスクリプトを実行し、`GEMINI.md`を作成（または追記）します。
    ```bash
    ./script/create_gemini_md.sh
    ```
    このスクリプトは、`GEMINI.md`に以下の内容を記述します。
    ```markdown
    ### 設定ファイル管理
    あなたは開発補助AIです。
    ~/vibeSettings内のMAIN.mdを読み込み、内容に従って振る舞ってください。
    ```
2.  **エイリアスの設定 (推奨):**
    `create_gemini_md.sh`スクリプトをどこからでも実行できるように、`~/.bashrc`または`~/.zshrc`にエイリアスを設定することを推奨します。
    ```bash
    # ~/.bashrc または ~/.zshrc に追加
    alias create_gemini_md="bash ~/vibeSettings/script/create_gemini_md.sh"
    ```
    設定を反映させるために、ターミナルを再起動するか、`source ~/.bashrc`（または`source ~/.zshrc`）を実行してください。

3.  **Gemini CLIでの利用:**
    Gemini CLIエージェントとのセッション開始時に、"GEMINI.mdを読み込んで"と命令してください。

**Claudeの場合:** `~/.claude/CLAUDE.md`に以下を追加：
```markdown
# AI Assistant Configuration

### 設定ファイル管理
あなたは開発補助AIです。
~/vibeSettings内のMAIN.mdを読み込み、内容に従って振る舞ってください。
```

**他のAIの場合:** 各AIのグローバル設定ファイルに上記と同様の設定を記述

### 3. プロファイルの選択
`mode_profiles.md`を編集して使用したいプロファイルを選択：
```markdown
## ACTIVE_PROFILE: development_only  # ← ここを変更
## SPEED_MODE: cautious  # fast or cautious
```

## 📁 ディレクトリ構造

```
vibeSettings/
├── MAIN.md                    # エントリーポイント
├── mode_profiles.md           # 実際の設定（.gitignore）
├── configs/                   # 各種動作設定
│   ├── development.md         # 開発モード設定
│   ├── english_learning.md    # 英語学習モード
│   ├── interactive_mode.md    # インタラクティブモード
│   ├── strict_rules.md        # 厳守ルール（常時有効）
│   └── ...                    # その他の設定
├── docs/                      # ドキュメント類
├── samples/
│   └── mode_profiles.md.sample # プロファイル設定のサンプル
└── ideanote/                  # アイデアメモ（.gitignore）
    ├── templates/             # メモ用テンプレート
    ├── ongoing/               # 進行中のアイデア
    └── archive/               # アーカイブ
```

## 🎯 利用可能なプロファイル

### default
基本的な開発環境設定
- 開発モード
- 英語学習モード
- 厳守ルール

### development_only
開発に特化した設定
- 開発モード
- システム解析モード
- 厳守ルール

### learning_focus
学習重視の設定
- 英語学習モード
- 対話設定モード
- インタラクティブモード

### full
全機能有効（重い）
- すべての設定を有効化

## ⚙️ カスタマイズ方法

### 新しいプロファイルの作成
`mode_profiles.md`に新しいセクションを追加：
```markdown
### my_custom_profile
- configs/development.md
- configs/documentation.md
- configs/strict_rules.md
```

### 速度モードの切り替え
- **fast**: 高速応答、簡潔な説明
- **cautious**: 詳細な検証、丁寧な説明

### 新しい設定ファイルの追加
1. `configs/`ディレクトリに新しい`.md`ファイルを作成
2. 設定内容を記述
3. プロファイルに追加

## 🔧 高度な使い方

### 環境別設定
```bash
# 本番用とローカル用で設定を分ける
cp mode_profiles.md mode_profiles.prod.md
cp mode_profiles.md mode_profiles.local.md
```

### Git管理のベストプラクティス
- `mode_profiles.md.sample`のみをコミット
- 個人設定は`.gitignore`で除外
- チーム共通設定は`configs/`に配置

## 📝 設定ファイルの書き方

各設定ファイルは以下の形式で記述：
```markdown
# 設定名

## 概要
この設定の説明

## 動作ルール
- ルール1
- ルール2

## 速度モード別の動作
### fast
- 簡潔な動作

### cautious  
- 詳細な動作
```

## 🤝 コントリビューション

新しい設定テンプレートの提案は大歓迎です！
1. このリポジトリをフォーク
2. 新しい設定を`configs/`に追加
3. プルリクエストを送信

## 📄 ライセンス

MIT License

## 🔗 関連リンク

- [Gemini活用Tips](./docs/GEMINI_TIPS.md)
- [Claude公式ドキュメント](https://docs.anthropic.com/en/docs/claude-code)（Claudeの場合）
- [プロジェクト別設定ガイド](./docs/PROJECT_SETUP.md)
- [設定例集](./docs/templates/README.md)
- [トラブルシューティング](./docs/GLOBAL_SETUP.md)
