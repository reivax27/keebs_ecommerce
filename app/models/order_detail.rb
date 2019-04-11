# frozen_string_literal: true

class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, :priceOnOrder, presence: true
end
