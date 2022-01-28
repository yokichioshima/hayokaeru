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
| category_id            | integer | null: false 
|
| options             | string    |     

### Association
- has_one_attached :image
- has_many :materials, through: :product_materials
- has_many :orders, through: :order_products


## product_materialsテーブル
| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product                    | references | null: false, foreign_key: true |
| material                   | references | null: false, foreign_key: true |
| single_quantity            | float    |                        |

### Association
- belongs_to :material
- belongs_to :product


## ordersテーブル
| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string       | null: false                    |
| product_1                  | integer     | foreign_key: true        |
| product_2                  | integer     | foreign_key: true        |
| product_3                  | integer     |foreign_key: true        |
| product_4                  | integer     | foregin_key: true        |
| product_5                  | integer     | foregin_key: true        |
| single_quantity            | float       |
                         |
                                                  
### Association
- has_many :products