class Book < ApplicationRecord
  belongs_to :author
  has_many :publishers
  validates :title, presence: true, length: {minimum: 2}
  paginates_per 15
end
