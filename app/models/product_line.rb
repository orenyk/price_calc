class ProductLine < ActiveRecord::Base

  # associations
  has_many :product_sets
  has_many :products

  # validations
  validates :name, presence: true, uniqueness: true

end