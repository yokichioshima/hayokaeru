require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '料理の登録' do
    context '料理の登録ができる場合' do
      it '料理画像と料理名と分類を入力すれば登録できる' do
        expect(@product).to be_valid
      end
      it 'メモが空でも登録できる' do
        @product.options = ''
        expect(@product).to be_valid
      end
    end
    context '料理の登録ができない場合' do
      it '料理画像がなければ登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("料理画像を入力してください")
      end
      it '料理名が空では登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("料理名を入力してください")
      end
      it '分類が -- では登録できない' do
        @product.sort_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("分類を入力してください")
      end
    end
  end
end
