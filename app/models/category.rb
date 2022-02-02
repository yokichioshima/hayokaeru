class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '肉類・魚類・大豆製品' },
    { id: 3, name: '乳製品・海藻・小魚類' },
    { id: 4, name: '緑黄色野菜' },
    { id: 5, name: '淡色野菜・果物' },
    { id: 6, name: '穀類・芋類・砂糖' },
    { id: 7, name: '油脂類' },
    { id: 8, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :materials
end