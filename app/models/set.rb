class Set < ActiveRecord::Base

  # associations
  has_many :products

  # validations
  validates :name, presence: true

end