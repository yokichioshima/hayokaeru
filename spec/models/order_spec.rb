require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '献立の登録' do
    context '献立が登録できる場合' do
      it '献立名があれば登録できる' do
        expect(@order).to be_valid
      end
    end
    context '献立が登録できない場合' do
      it '献立名が空では登録できない' do
        @order.name = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('献立の名前を入力してください')
      end
    end
  end
end
