class ProductSet < ActiveRecord::Base

  # associations
  has_many :products
  belongs_to :product_line

  # validations
  validates :name, presence: true, uniqueness: true

end