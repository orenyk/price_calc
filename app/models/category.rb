class Category < ActiveRecord::Base

  # associations
  has_many :products

  # validations
  validates :name, presence: true, uniqueness: true

end