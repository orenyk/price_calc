class Price < ActiveRecord::Base

  # validations
  validates :name, presence: true
  validates :multiple, presence: true,
    numericality: { greater_than_or_equal_to: 0 }

end