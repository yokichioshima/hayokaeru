module OrdersHelper
    # 献立に使用されている食材と分量をそれぞれ配列に格納する
    def collect_materials(orders)
        materials = []
        quantities = {}
        orders.each do |order|
            order.products.each do |product|
                product.materials.each do |material|
                    materials << material
                    quantities[material.id] = 0 if quantities[material.id].nil?
                    quantities[material.id] += product.product_materials.select do |hash|
                                                    hash.material_id == material.id
                                                end [0].single_quantity
                end
            end
        end
        materials = materials.uniq
        [materials, quantities]
    end
end
