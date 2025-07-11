# マイクロサービスプロジェクト

## プロジェクトの目的
[マイクロサービスアーキテクチャの目的と解決する課題を記載]

## サービス一覧
| サービス名 | 責務 | ポート | 技術スタック |
|-----------|------|--------|------------|
| api-gateway | APIゲートウェイ | 3000 | Node.js + Express |
| auth-service | 認証・認可 | 3001 | Node.js + JWT |
| user-service | ユーザー管理 | 3002 | Node.js + PostgreSQL |
| product-service | 商品管理 | 3003 | Node.js + MongoDB |
| order-service | 注文処理 | 3004 | Node.js + PostgreSQL |
| notification-service | 通知配信 | 3005 | Node.js + Redis |

## アーキテクチャ概要
```
┌─────────────┐
│   Client    │
└──────┬──────┘
       │
┌──────▼──────┐
│ API Gateway │
└──────┬──────┘
       │
   ┌───┴───┬────────┬────────┬────────┐
   │       │        │        │        │
┌──▼──┐ ┌─▼──┐ ┌──▼──┐ ┌──▼──┐ ┌──▼──┐
│Auth │ │User│ │Prod │ │Order│ │Notif│
└─────┘ └────┘ └─────┘ └─────┘ └─────┘
```

## 共通設定
- 通信プロトコル: REST API / gRPC
- サービス間通信: RabbitMQ
- サービスディスカバリ: Consul
- 設定管理: Consul KV
- ログ収集: Fluentd + Elasticsearch
- モニタリング: Prometheus + Grafana
- トレーシング: Jaeger

## プロジェクト構造
```
microservices/
├── services/
│   ├── api-gateway/
│   ├── auth-service/
│   ├── user-service/
│   ├── product-service/
│   ├── order-service/
│   └── notification-service/
├── shared/
│   ├── contracts/      # API契約（Proto files）
│   ├── libraries/      # 共通ライブラリ
│   └── configs/        # 共通設定
├── infrastructure/
│   ├── docker/         # Docker設定
│   ├── kubernetes/     # K8s マニフェスト
│   └── terraform/      # インフラ定義
└── scripts/           # 運用スクリプト
```

## 開発環境セットアップ
```bash
# Docker Compose で全サービス起動
docker-compose up -d

# 特定サービスのみ起動
docker-compose up -d auth-service user-service

# ログ確認
docker-compose logs -f [service-name]

# データベース初期化
./scripts/init-databases.sh
```

## サービス間通信

### 同期通信（REST/gRPC）
```typescript
// user-serviceからauth-serviceを呼び出す例
const authClient = new AuthServiceClient({
  baseURL: process.env.AUTH_SERVICE_URL
});

const isValid = await authClient.validateToken(token);
```

### 非同期通信（メッセージキュー）
```typescript
// order-serviceからnotification-serviceへ通知
await messageQueue.publish('order.created', {
  orderId: order.id,
  userId: order.userId,
  amount: order.totalAmount
});
```

## API契約管理
```protobuf
// shared/contracts/user.proto
syntax = "proto3";

service UserService {
  rpc GetUser (GetUserRequest) returns (UserResponse);
  rpc CreateUser (CreateUserRequest) returns (UserResponse);
}

message GetUserRequest {
  string user_id = 1;
}

message UserResponse {
  string id = 1;
  string email = 2;
  string name = 3;
}
```

## エラーハンドリング
- サービス固有のエラーコード体系
- Circuit Breakerパターンの実装
- リトライ戦略の定義
- エラーの集約とモニタリング

## テスト戦略
- 単体テスト: 各サービス内で完結
- 統合テスト: サービス間の連携確認
- Contract Testing: API契約の検証
- カオステスト: 障害耐性の確認

## デプロイメント戦略
```bash
# 開発環境
kubectl apply -f k8s/dev/

# ステージング環境
kubectl apply -f k8s/staging/

# 本番環境（Blue-Green デプロイ）
./scripts/deploy-production.sh [service-name] [version]
```

## 運用・監視
- ヘルスチェック: `/health` エンドポイント
- メトリクス: `/metrics` エンドポイント
- ログレベル: 環境変数で動的変更
- アラート設定: Prometheusルール

## セキュリティ
- [ ] サービス間のmTLS通信
- [ ] APIキー管理（Vault）
- [ ] ネットワークポリシー
- [ ] シークレット管理
- [ ] 監査ログ

## スケーリング戦略
- 水平スケーリング: HPA設定
- 垂直スケーリング: リソース要求の調整
- データベース: Read Replicaの活用
- キャッシュ: Redis Clusterの利用

## 開発ルール
1. **独立性**: 各サービスは独立してデプロイ可能
2. **データ所有権**: 各サービスは自身のデータストアを持つ
3. **APIバージョニング**: 後方互換性を保つ
4. **ドキュメント**: OpenAPI/gRPC定義を常に最新に
5. **監視**: 全てのサービスにメトリクスを実装

## トラブルシューティング
```bash
# サービスの状態確認
kubectl get pods -n microservices

# ログ確認
kubectl logs -f deployment/[service-name] -n microservices

# サービスメッシュの状態
istioctl proxy-status

# 分散トレーシング
# Jaeger UIで確認: http://localhost:16686
```

## 開発モード設定
**現在慎重モード**

### モード切り替え方法
- 高速モード: "高速モードに切り替えて"
- 慎重モード: "慎重モードに切り替えて"