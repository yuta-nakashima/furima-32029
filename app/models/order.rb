class Order < ApplicationRecord
  attr_accessor :token

  belongs_to :user
  belongs_to :item
  has_one :delivery
  #validates :token, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_from

end
