class Order < ApplicationRecord

  belongs_to :user
  belongs_to :item
  #attr_accessor :token
  validates :price, presence: true
  #validates :token, presence: true
end
