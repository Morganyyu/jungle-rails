class Review < ActiveRecord::Base
  belongs_to :product
  validates :rating, presence: true
  validates :description, presence: true
end