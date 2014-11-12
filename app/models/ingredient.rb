class Ingredient < ActiveRecord::Base

  # associations
  belongs_to :product
  belongs_to :component

  # validations
  validates :count, presence: true,
    numericality: { only_integer: true, greater_than: 0 }
  validates :unit_cost, presence: true,
    numericality: { greater_than_or_equal_to: 0 }
  validates :total_cost, presence: true,
    numericality: { greater_than_or_equal_to: 0 }
  validate :product_present
  validate :component_present

  # hooks
  before_validation :finalize

  # evaluate the unit cost for this ingredient (pulls from database to keep
  # data up to date)
  def unit_cost
    @unit_cost ||= component.cost
  end

private

  # checks that the product is valid
  def product_present
    if product.nil?
      errors.add(:product, 'is not valid.')
    end
  end

  # checks that the component is valid
  def component_present
    if component.nil?
      errors.add(:component, 'is not valid.')
    end
  end

  # save costs to database
  def finalize
    self[:unit_cost] = unit_cost
    self[:total_cost] = count * self[:unit_cost]
  end

end