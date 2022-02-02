require 'rails_helper'

RSpec.describe Material, type: :model do
  before do
    @material = FactoryBot.build(:material)
  end

  describe '食材データの保存' do
    context '食材データを保存できる場合' do
      it 'すべての項目を入力すれば保存できる' do
        expect(@material).to be_valid
      end
      it '価格が空でも保存できる' do
        @material.price = ''
        expect(@material).to be_valid
      end
      it '追加事項が空でも保存できる' do
        @material.options = ''
        expect(@material).to be_valid
      end
      it '価格と追加事項が空でも保存できる' do
        @material.price = ''
        @material.options = ''
        expect(@material).to be_valid
      end
    end

    context '食材データが保存できない場合' do
      it '名前が空では保存できない' do
        @material.name = ''
        @material.valid?
        expect(@material.errors.full_messages).to include("Name can't be blank")
      end
      it '画像がなければ保存できない' do
        @material.image = nil
        @material.valid?
        expect(@material.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idが1では保存できない' do
        @material.category_id = 1
        @material.valid?
        expect(@material.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
