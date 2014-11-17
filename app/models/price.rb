class Price < ActiveRecord::Base

  # validations
  validates :name, presence: true, uniqueness: true
  validates :multiple, presence: true,
    numericality: { greater_than_or_equal_to: 0 }

  # methods
  def multiple_with_vat
    mult = Settings.VAT ? Settings.VAT : 1
    multiple*mult
  end

end