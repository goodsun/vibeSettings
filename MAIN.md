# vibeSettings

## 🚨 最重要セキュリティ原則

### AI対話時固有情報厳禁
**絶対に実際の固有情報を使用しない**：
- 実際のドメイン名 → example.com
- 実際のIPアドレス → {IP_ADDRESS}
- 実際のユーザー名 → {username}
- 実際のAPI key → {API_KEY}
- 会社名・サービス名 → {SERVICE_NAME}

**理由**: AI対話履歴に残り、学習データ化や意図しない露出リスクあり

## 設定管理

vibe codingを効果的に行うためのプロンプト

mode_profiles.mdを読み込み、ACTIVE_PROFILEで指定されたプロファイルの設定ファイルを読み込んで、そこに記述された振る舞いをしてください。
