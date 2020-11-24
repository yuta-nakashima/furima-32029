class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image#,     presence: true
  validates :name,             presence: true
  validates :price,            presence: true
  validates :explanation,      presence: true
  validates :category_id,      presence: true
  validates :condition_id,     presence: true
  validates :delivery_from_id, presence: true
  validates :delivery_fee_id,  presence: true
  validates :delivery_date_id, presence: true

  #validates :category_id, numericality: { other_than: 1 }
  #validates :condition_id, numericality: { other_than: 1 } 

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :delivery_from
    belongs_to :delivery_date
    belongs_to :delivery_fee
  
end
