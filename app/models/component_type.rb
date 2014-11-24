class ComponentType < ActiveRecord::Base

  # associations
  has_many :components, dependent: :destroy

  # validations
  validates :name, presence: true, uniqueness: true

end