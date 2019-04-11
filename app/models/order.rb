# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  has_many :products, through: :order_details

  validates :orderDate, :orderTotal, presence: true
end
