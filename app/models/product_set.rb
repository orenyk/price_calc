class ProductSet < ActiveRecord::Base

  # associations
  has_many :products

  # validations
  validates :name, presence: true

end