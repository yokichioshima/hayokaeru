class OrderProduct < ApplicationRecord
    Max_Order_Products_Count = 5
    belongs_to :product
    belongs_to :order

    validate :limit_order_products_count

    private

    def limit_order_products_count
        errors.add(:base, "#{Max_Order_Products_Count}品までです") if order.products.count >= Max_Order_Products_Count
    end
end
