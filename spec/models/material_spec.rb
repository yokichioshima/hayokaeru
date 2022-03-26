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
      it '追加事項が空でも保存できる' do
        @material.options = ''
        expect(@material).to be_valid
      end
    end

    context '食材データが保存できない場合' do
      it '名前が空では保存できない' do
        @material.name = ''
        @material.valid?
        expect(@material.errors.full_messages).to include('食材名を入力してください')
      end
      it '画像がなければ保存できない' do
        @material.image = nil
        @material.valid?
        expect(@material.errors.full_messages).to include('食材画像を入力してください')
      end
      it '基礎食品群が -- では保存できない' do
        @material.category_id = 1
        @material.valid?
        expect(@material.errors.full_messages).to include('基礎食品群を入力してください')
      end
      it '分量の単位が空では保存できない' do
        @material.quantity_unit = ''
        @material.valid?
        expect(@material.errors.full_messages).to include('分量の単位を入力してください')
      end
    end
  end
end
