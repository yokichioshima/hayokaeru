class MaterialsController < ApplicationController
  def index
    @materials_2 = Material.where(category_id: 2)
    @materials_3 = Material.where(category_id: 3)
    @materials_4 = Material.where(category_id: 4)
    @materials_5 = Material.where(category_id: 5)
    @materials_6 = Material.where(category_id: 6)
    @materials_7 = Material.where(category_id: 7)
    @materials_8 = Material.where(category_id: 8)
  end
end
