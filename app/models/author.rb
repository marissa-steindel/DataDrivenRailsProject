class Author < ApplicationRecord
  has_many :books

  validates :name, presence: true
  paginates_per 5

end
