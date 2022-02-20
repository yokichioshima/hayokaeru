# アプリケーション名
  Matelist

# 概要
  献立、料理、食材という３種類のデータを取り扱い、献立はいくつかの料理から構成され、料理はいくつかの食材から構成される仕組みである。ユーザーが献立を登録すると、その献立に必要な食材が画面表示される。

# URL
https://hayokaeru.herokuapp.com/

# テスト用アカウント
- Basic認証パスワード ： permit
- Basic認証ID : 6297

# 利用方法
## 献立の登録
1. トップページ（献立一覧ページ）で表示されている献立を確認する。  
2. 登録したい献立があれば、画面右上の「献立登録」ボタンをクリックする。  
3. 「献立を組み立てる」ページで、献立の名前、料理を入力する。このとき、料理は画面右側にある画像をクリックすることで入力できる。なお、再度画像をクリックすると、入力は取り消される。最後に登録ボタンを押すと、献立が登録される。料理を登録していなければ、この操作はできないことに注意する。

## 献立の食材を確認
1. トップページで、画面右上の「買い物リスト」ボタンを押す。  
2. 「買い物リスト」ページで必要な食材が表示れる。表示は、6つの食品群に分類されている。

# アプリケーションを作成した背景  
  作成者は、最寄りの食料品店が片道車で１５分程の運転が必要な場所に住んでいる。家族に頼まれて、食料品店に買いものに行くことがあるが、事前に必要な食材のリストを紙に書いてもらっていたが、持ち物として紙が増えるんは煩わしい。また、今晩の献立を考えることも非常に煩わしいことがある。これらの問題を分析した結果、以下の解決法を思いついた。 
  1. 携帯電話にメモをする。 
  2. 料理の一覧表を見て、献立を考えることができる。
  従って、この２つの機能を備えたアプリケーションを開発することにした。

# アプリケーションの要件
https://docs.google.com/spreadsheets/d/1Npi79QOl1FZ6457Fd_g7NoSgYYbopMXIICFeiLYuj4g/edit#gid=982722306

# 実装した機能についての画像・動画
- 献立一覧と買い物リスト  
献立一覧には登録された献立が掲載される。買い物リストにはそれらの食材が全て表示される。
https://gyazo.com/a889a52dee1b3d70710365b0558209e0

- 料理一覧機能
登録した料理が分類別に表示される。
https://gyazo.com/66a1118e1b9d7aca787f99d0b4717c34

- 献立登録機能
献立を料理から選んで登録する。画像をクリックすると入力される。再度同じ画像をクリックするとキャンセルする。
https://gyazo.com/e713ee965e622e43f6218118d3c15615  
料理の順番を並び替えることができる。
https://gyazo.com/3ecd7b3dbb32d3d75788c0fe5e974db8

# 実装予定の機能
- 現在、買い物リストに食材の分量を表示する機能を実装中
- 検索機能
- 献立一覧の献立の並び替え機能
- スマホアプリ化

# データベース設計  
<img width="546" alt="スクリーンショット 2022-02-17 1 06 26" src="https://user-images.githubusercontent.com/96287511/154307502-2dd1b51d-9daf-4ec8-a370-f0bd3a7076a0.png">

# 画面遷移図  
<img width="689" alt="スクリーンショット 2022-02-17 1 33 17" src="https://user-images.githubusercontent.com/96287511/154314205-b17f6702-7c3c-479b-a25f-bdfc996c3f86.png">  

# 開発環境  
- フロントエンド
- バックエンド
- インフラ
- テスト
- テキストエディタ
- タスク管理

# ローカルでの動作  
以下のコマンドを順に実行。
% git clone https://github.com/yokichioshima/hayokaeru  
% cd yokichioshima/hayokaeru  
% bundle install  
% yarn install

# 工夫したポイント
以下の３点を工夫した。  
- 画像をクリックする操作により、登録、編集、削除をできるようにした点
- 献立登録の際に、サイドバーの料理名の順番をスワップ操作により入れ替えるようにした点
- 食材ごとに分量の単位を登録することができ、買い物リストでは、購入する食材とその分量まで表示される。

# テーブル設計

## materialsテーブル
| Column                 | Type    | Options                           |
| ---------------------- | ------- | --------------------------------- |
| name                   | string  | null: false                       |
| category_id            | integer  | null: false                       |
| quantity_unit          | string  |null: false                       |
| options                | string  | 
|                 

### Association
- has_one_attached :image
- has_many :products, through: :product_materials


## productsテーブル
| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| sort_id                | integer    | null: 
false                    |
| options                | string     |      |  

### Association
- has_one_attached :image
- has_many :materials, through: :product_materials
- has_many :orders, through: :order_products
- has_many :order_products, dependent: :destroy


## ordersテーブル
| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string       | null: false                    |
                                                  
### Association
- has_many :products, through: :order_products
- has_many :order_products, dependent: :destroy


## product_materialsテーブル
| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product                    | references | null: false, foreign_key: true |
| material                   | references | null: false, foreign_key: true |
| single_quantity            | float    |                        |

### Association
- belongs_to :material
- belongs_to :product


## order_productsテーブル
| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| order                    | references | null: false, foreign_key: true |
| product                   | references | null: false, foreign_key: true |

### Association
- belongs_to :product
- belongs_to :order