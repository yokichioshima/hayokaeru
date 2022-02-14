## materialsテーブル
| Column                 | Type    | Options                           |
| ---------------------- | ------- | --------------------------------- |
| name                   | string  | null: false                       |
| category_id            | integer  | null: false       
|
| price                  | integer |                        |
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