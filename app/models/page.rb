class Page < ApplicationRecord
  validates :title, :content, presence: true
end
