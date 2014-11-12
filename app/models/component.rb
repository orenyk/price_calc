class Component < ActiveRecord::Base

  # associations
  belongs_to :type
  has_many :ingredients

  # validations
  validates :name, presence: true
  validates :cost, presence: true,
    numericality: { greater_than_or_equal_to: 0 }

end