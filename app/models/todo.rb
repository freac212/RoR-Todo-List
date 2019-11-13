class Todo < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5, maximum: 100}
  validates :description, presence: true, length: {minimum: 5, maximum: 255}
  belongs_to :list, optional: true
end
