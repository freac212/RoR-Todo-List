class List < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5, maximum: 100}
  has_many :todos, dependent: :destroy
end
