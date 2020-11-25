class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  validates :price,            format: { with: /\A[0-9]+\z/ } # , message: '半角数字を使用してください' }
  validates :price,            numericality: { greater_than_or_equal_to: 300, less_than: 9_999_999 }
  
  with_options presence:true do
    validates :name
    validates :price
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :delivery_from_id
    validates :delivery_fee_id
    validates :delivery_date_id
    validates :image
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_from
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :delivery_fee
end
