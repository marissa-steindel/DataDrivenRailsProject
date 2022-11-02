class Author < ApplicationRecord
  has_many :books
  validates :name, presence: true, length: {minimum: 2}
  paginates_per 5
end
