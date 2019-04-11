# frozen_string_literal: true

class Page < ApplicationRecord
  validates :title, :content, presence: true
end
