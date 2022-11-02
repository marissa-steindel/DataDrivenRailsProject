class Book < ApplicationRecord
  belongs_to :author
  validates :title, presence: true, length: {minimum: 2}
  paginates_per 15
end
