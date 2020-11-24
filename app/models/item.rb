class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image,   predences: true
  validates :price,            predences: true
  validates :explanation,      predences: true
  validates :category_id,      predences: true
  validates :condition_id,     predences: true
  validates :delivery_from_id, predences: true
  validates :delivery_fee_id,  predences: true
  validates :delivery_date_id, predences: true



end
