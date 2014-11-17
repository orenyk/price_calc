class ComponentType < ActiveRecord::Base

  # associations
  has_many :components

  # validations
  validates :name, presence: true, uniqueness: true

end