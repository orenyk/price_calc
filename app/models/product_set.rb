class ProductSet < ActiveRecord::Base

  # associations
  has_many :products
  belongs_to :product_line

  # validations
  validates :name, presence: true, uniqueness: true
  validates :product_line_id, presence: true

end