class Type < ActiveRecord::Base

  # associations
  has_many :components

  # validations
  validates :name, presence: true

end