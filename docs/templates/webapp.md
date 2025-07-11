# Webアプリケーション名

## プロジェクトの目的
[Webアプリケーションの概要と主要機能を記載]

## アーキテクチャ
- フロントエンド: React + TypeScript
- バックエンド: Node.js + Express
- データベース: PostgreSQL
- キャッシュ: Redis
- 認証: JWT

## ディレクトリ構造
```
frontend/
  ├── src/
  │   ├── components/    # 再利用可能なUIコンポーネント
  │   ├── pages/        # ページコンポーネント
  │   ├── hooks/        # カスタムフック
  │   ├── services/     # API通信
  │   └── utils/        # ユーティリティ関数
backend/
  ├── src/
  │   ├── routes/       # APIルーティング
  │   ├── controllers/  # リクエストハンドリング
  │   ├── services/     # ビジネスロジック
  │   ├── models/       # データモデル
  │   └── middleware/   # Express ミドルウェア
```

## 開発環境セットアップ
```bash
# フロントエンド
cd frontend
npm install
npm run dev

# バックエンド（別ターミナル）
cd backend
npm install
npm run dev

# データベース初期化
npm run db:migrate
npm run db:seed
```

## API設計原則
- RESTful API設計
- HTTPステータスコードの適切な使用
- JSONレスポンス形式
- ページネーション対応
- エラーレスポンスの統一

### APIレスポンス形式
```typescript
// 成功時
{
  "success": true,
  "data": { ... },
  "meta": {
    "page": 1,
    "limit": 20,
    "total": 100
  }
}

// エラー時
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "入力値が不正です",
    "details": { ... }
  }
}
```

## 環境変数
```bash
# .env.example
NODE_ENV=development
PORT=3000
DATABASE_URL=postgresql://user:pass@localhost:5432/dbname
REDIS_URL=redis://localhost:6379
JWT_SECRET=your-secret-key
FRONTEND_URL=http://localhost:3001
```

## テスト戦略
- 単体テスト: Jest
- 統合テスト: Supertest
- E2Eテスト: Playwright
- カバレッジ目標: 80%以上

## デプロイメント
```bash
# ステージング環境
npm run deploy:staging

# 本番環境
npm run deploy:production
```

## セキュリティ対策
- [ ] CORS設定
- [ ] Rate Limiting
- [ ] SQL Injection対策
- [ ] XSS対策
- [ ] CSRF対策
- [ ] 入力値検証

## パフォーマンス最適化
- [ ] データベースインデックス
- [ ] APIレスポンスキャッシュ
- [ ] 画像最適化
- [ ] Code Splitting
- [ ] Lazy Loading

## 開発モード設定
**現在慎重モード**

### モード切り替え方法
- 高速モード: "高速モードに切り替えて"
- 慎重モード: "慎重モードに切り替えて"