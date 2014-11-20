class ProductLine < ActiveRecord::Base

  # associations
  has_many :product_sets

  # validations
  validates :name, presence: true, uniqueness: true

end