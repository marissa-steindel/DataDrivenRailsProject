class Book < ApplicationRecord
  belongs_to :author

  validates :title, presence: true
  paginates_per 15

end
