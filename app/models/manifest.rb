class Manifest < ActiveRecord::Base
  belongs_to :component
  belongs_to :product

  validates :count, presence: true, numericality: {
    only_integer: true,
    greater_than: 0 }
  validate :component_present
  validate :product_present

  before_save :finalize

  def unit_cost
    persisted? ? self[:unit_cost] : component.cost
  end

  def total_cost
    unit_cost * count
  end

  private

  def component_present
    if component.nil?
      errors.add(:component, "is not valid.")
    end
  end

  def product_present
    if product.nil?
      errors.add(:product, "is not valid.")
    end
  end

  def finalize
    self[:unit_cost] = unit_cost
    self[:total_cost] = count * self[:unit_cost]
  end
end