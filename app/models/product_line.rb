class ProductLine < ActiveRecord::Base

  # associations
  has_many :product_sets, dependent: :destroy
  has_many :products, dependent: :destroy

  # validations
  validates :name, presence: true, uniqueness: true

end