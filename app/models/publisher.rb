class Publisher < ApplicationRecord
  belongs_to :book
  belongs_to :country
end
