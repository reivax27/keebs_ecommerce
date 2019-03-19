class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details
  has_many :products, through: :order_details

  validates :name, :description, :price, :unitStock, presence: true
end
