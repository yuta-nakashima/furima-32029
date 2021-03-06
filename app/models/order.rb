class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :delivery

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_from
end
