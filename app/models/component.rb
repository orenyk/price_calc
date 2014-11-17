class Component < ActiveRecord::Base

  # associations
  belongs_to :component_type
  has_many :ingredients, dependent: :destroy

  # validations
  validates_presence_of :component_type
  validates :name, presence: true
  validates :cost, presence: true,
    numericality: { greater_than_or_equal_to: 0 }

end