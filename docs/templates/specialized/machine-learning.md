# 機械学習プロジェクト

## プロジェクトの目的
[機械学習プロジェクトの目的と解決する課題を記載]

## プロジェクト構造
```
ml-project/
├── data/
│   ├── raw/            # 生データ
│   ├── processed/      # 前処理済みデータ
│   └── external/       # 外部データ
├── notebooks/          # Jupyter Notebooks
│   ├── 01_EDA.ipynb   # 探索的データ分析
│   ├── 02_preprocessing.ipynb
│   └── 03_modeling.ipynb
├── src/
│   ├── data/          # データ処理スクリプト
│   ├── features/      # 特徴量エンジニアリング
│   ├── models/        # モデル定義
│   ├── training/      # 学習スクリプト
│   └── evaluation/    # 評価スクリプト
├── models/            # 学習済みモデル
├── configs/           # 設定ファイル
├── tests/             # テストコード
└── docs/              # ドキュメント
```

## 技術スタック
- Python: 3.9+
- 主要ライブラリ:
  - NumPy, Pandas: データ処理
  - Scikit-learn: 古典的ML
  - TensorFlow/PyTorch: 深層学習
  - Optuna: ハイパーパラメータ調整
  - MLflow: 実験管理
  - DVC: データバージョン管理

## データパイプライン
```python
# データ処理の流れ
1. データ取得（data/raw/）
2. 前処理（src/data/preprocessing.py）
3. 特徴量生成（src/features/）
4. 学習用データ分割
5. モデル学習（src/training/）
6. 評価（src/evaluation/）
7. モデル保存（models/）
```

## 実験管理
```yaml
# configs/experiment_001.yaml
experiment:
  name: "baseline_model"
  description: "ベースラインモデルの実装"
  
data:
  train_path: "data/processed/train.csv"
  test_path: "data/processed/test.csv"
  
model:
  type: "RandomForest"
  params:
    n_estimators: 100
    max_depth: 10
    random_state: 42
    
training:
  cv_folds: 5
  metrics: ["accuracy", "f1", "auc"]
```

## モデル開発フロー

### 1. データ分析
```python
# notebooks/01_EDA.ipynb で実施
- データの基本統計量
- 欠損値の確認
- 分布の可視化
- 相関分析
```

### 2. 前処理
```python
# src/data/preprocessing.py
def preprocess_data(df):
    # 欠損値処理
    # カテゴリ変数のエンコーディング
    # 数値変数の正規化
    # 外れ値の処理
    return processed_df
```

### 3. 特徴量エンジニアリング
```python
# src/features/feature_engineering.py
def create_features(df):
    # ドメイン知識に基づく特徴量
    # 統計的特徴量
    # 時系列特徴量
    # テキスト特徴量
    return feature_df
```

### 4. モデル学習
```python
# src/training/train.py
def train_model(X_train, y_train, config):
    model = create_model(config)
    model.fit(X_train, y_train)
    
    # MLflowで実験を記録
    mlflow.log_params(config)
    mlflow.log_metrics(metrics)
    mlflow.sklearn.log_model(model, "model")
    
    return model
```

## 評価指標
```python
# 分類問題
- Accuracy
- Precision/Recall
- F1-score
- AUC-ROC
- Confusion Matrix

# 回帰問題
- MSE/RMSE
- MAE
- R²
- MAPE
```

## ハイパーパラメータ調整
```python
# Optunaを使用した例
import optuna

def objective(trial):
    params = {
        'n_estimators': trial.suggest_int('n_estimators', 50, 300),
        'max_depth': trial.suggest_int('max_depth', 4, 20),
        'learning_rate': trial.suggest_float('learning_rate', 0.01, 0.3)
    }
    
    model = XGBClassifier(**params)
    score = cross_val_score(model, X, y, cv=5).mean()
    
    return score

study = optuna.create_study(direction='maximize')
study.optimize(objective, n_trials=100)
```

## モデルのデプロイ準備
```python
# モデルのシリアライズ
import joblib

# 保存
joblib.dump(model, 'models/model_v1.pkl')

# 推論API用のラッパー
class ModelPredictor:
    def __init__(self, model_path):
        self.model = joblib.load(model_path)
        
    def predict(self, features):
        # 前処理
        processed = preprocess(features)
        # 予測
        prediction = self.model.predict(processed)
        return prediction
```

## 実験の再現性
```bash
# 環境の固定
pip freeze > requirements.txt

# 乱数シードの固定
RANDOM_SEED = 42
np.random.seed(RANDOM_SEED)
torch.manual_seed(RANDOM_SEED)

# データバージョン管理（DVC）
dvc add data/raw/dataset.csv
git add data/raw/dataset.csv.dvc
```

## モニタリング
- [ ] モデルの性能劣化検知
- [ ] データドリフトの監視
- [ ] 予測分布の変化
- [ ] システムメトリクス

## よく使うコマンド
```bash
# 実験の実行
python src/training/train.py --config configs/experiment_001.yaml

# 評価の実行
python src/evaluation/evaluate.py --model models/model_v1.pkl

# MLflow UIの起動
mlflow ui --port 5000

# Jupyter Labの起動
jupyter lab --port 8888

# テストの実行
pytest tests/
```

## ベストプラクティス
1. **バージョン管理**: コード、データ、モデル全てを管理
2. **実験記録**: 全ての実験をMLflowで記録
3. **コードの品質**: pylint, blackでコード品質を保つ
4. **ドキュメント**: 実験の背景と結果を必ず記録
5. **再現性**: 環境と乱数シードを固定

## GPU環境設定
```python
# PyTorchの場合
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
model.to(device)

# TensorFlowの場合
physical_devices = tf.config.list_physical_devices('GPU')
if len(physical_devices) > 0:
    tf.config.experimental.set_memory_growth(physical_devices[0], True)
```

## トラブルシューティング
```bash
# メモリ不足の場合
- バッチサイズを小さくする
- データ型を変更（float64 → float32）
- メモリマップを使用

# 学習が進まない場合
- 学習率の調整
- 正規化の確認
- 勾配クリッピング

# 過学習の場合
- Dropout追加
- データ拡張
- Early Stopping
```

## 開発モード設定
**現在慎重モード**

### モード切り替え方法
- 高速モード: "高速モードに切り替えて"
- 慎重モード: "慎重モードに切り替えて"