class Article < ApplicationRecord
  validates :title, length: { minimum: 3 }
  validates :description, length: { minimum: 3 }
end