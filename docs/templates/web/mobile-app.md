# モバイルアプリプロジェクト

## プロジェクトの目的
[モバイルアプリの概要と主要機能を記載]

## 技術スタック
- プラットフォーム: iOS / Android
- 開発手法: React Native / Flutter / Native
- 状態管理: Redux / MobX / Provider
- バックエンド: Firebase / 独自API
- 認証: Firebase Auth / Auth0

## プロジェクト構造
```
mobile-app/
├── src/
│   ├── screens/        # 画面コンポーネント
│   ├── components/     # 再利用可能なUI部品
│   ├── navigation/     # ナビゲーション設定
│   ├── services/       # API通信・外部サービス
│   ├── store/          # 状態管理
│   ├── utils/          # ユーティリティ関数
│   └── constants/      # 定数定義
├── assets/             # 画像・フォント等
├── ios/                # iOS固有の設定
├── android/            # Android固有の設定
└── __tests__/          # テストファイル
```

## 開発環境セットアップ

### 共通設定
```bash
# 依存関係のインストール
npm install

# iOS向け（Macのみ）
cd ios && pod install
```

### 開発サーバー起動
```bash
# Metro bundler起動
npm start

# iOS（Macのみ）
npm run ios

# Android
npm run android
```

## 画面一覧と遷移
```
┌─────────────┐
│  Splash     │
└──────┬──────┘
       │
┌──────▼──────┐     ┌─────────────┐
│   Login     │────▶│  Register   │
└──────┬──────┘     └─────────────┘
       │
┌──────▼──────┐
│    Home     │
└─┬───┬───┬───┘
  │   │   │
  ▼   ▼   ▼
[各種機能画面]
```

## スタイリング規約
```typescript
// styles.ts
export const colors = {
  primary: '#007AFF',
  secondary: '#5856D6',
  danger: '#FF3B30',
  success: '#34C759',
  warning: '#FF9500',
  text: '#000000',
  background: '#F2F2F7'
};

export const spacing = {
  xs: 4,
  sm: 8,
  md: 16,
  lg: 24,
  xl: 32
};
```

## API通信
```typescript
// API基本設定
const API_BASE_URL = __DEV__ 
  ? 'http://localhost:3000/api'
  : 'https://api.production.com';

// 認証ヘッダー付きリクエスト
const apiCall = async (endpoint: string, options = {}) => {
  const token = await getAuthToken();
  return fetch(`${API_BASE_URL}${endpoint}`, {
    ...options,
    headers: {
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json',
      ...options.headers
    }
  });
};
```

## プッシュ通知設定
- iOS: APNs設定
- Android: FCM設定
- 通知権限のリクエスト
- トークン管理

## ディープリンク設定
```
アプリスキーム: myapp://
Universal Links: https://myapp.com/app/

例:
- myapp://profile/123
- myapp://product/456
- https://myapp.com/app/invite/abc123
```

## パフォーマンス最適化
- [ ] 画像の最適化とキャッシング
- [ ] リスト仮想化（FlatList）
- [ ] メモ化（React.memo, useMemo）
- [ ] 遅延読み込み
- [ ] バンドルサイズの最適化

## テスト戦略
```bash
# ユニットテスト
npm test

# E2Eテスト（Detox）
npm run e2e:ios
npm run e2e:android

# 型チェック
npm run type-check
```

## リリースプロセス

### iOS
```bash
# ビルド番号更新
npm run bump:ios

# アーカイブ作成
npm run build:ios

# TestFlightアップロード
npm run upload:ios
```

### Android
```bash
# バージョン番号更新
npm run bump:android

# APK/AABビルド
npm run build:android

# Google Playアップロード
npm run upload:android
```

## アプリ内課金
- [ ] 商品登録（App Store / Google Play）
- [ ] 購入フロー実装
- [ ] レシート検証
- [ ] 復元機能

## アナリティクス
- イベントトラッキング設計
- ユーザー属性の定義
- コンバージョン設定
- クラッシュレポート

## セキュリティ
- [ ] 機密データの暗号化
- [ ] 安全な通信（HTTPS/証明書ピンニング）
- [ ] 生体認証の実装
- [ ] 脱獄/Root化検知
- [ ] コード難読化

## アクセシビリティ
- [ ] VoiceOver/TalkBack対応
- [ ] 適切なラベル付け
- [ ] コントラスト比の確保
- [ ] フォントサイズの調整

## トラブルシューティング
```bash
# Metro キャッシュクリア
npm start -- --reset-cache

# iOS関連の問題
cd ios && pod deintegrate && pod install

# Android関連の問題
cd android && ./gradlew clean

# 全体的なクリーンアップ
npm run clean:all
```

## 開発Tips
- Hot Reloadの活用
- React Developer Toolsの使用
- Flipperでのデバッグ
- シミュレータ/エミュレータの活用

## 開発モード設定
**現在高速モード**

### モード切り替え方法
- 高速モード: "高速モードに切り替えて"
- 慎重モード: "慎重モードに切り替えて"