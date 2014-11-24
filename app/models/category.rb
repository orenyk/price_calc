class Category < ActiveRecord::Base

  # associations
  has_many :products, dependent: :destroy

  # validations
  validates :name, presence: true, uniqueness: true

end