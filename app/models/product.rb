class Product < ActiveRecord::Base

  # associations
  belongs_to :category
  belongs_to :family
  has_many :ingredients

  # validations
  validates :name, presence: true
  validates :line, presence: true,
    inclusion: { in: ['juditb' 'jb'] }
  validates :material, presence: true,
    inclusion: {
      in: ['yellow gold', 'white gold', 'red gold', 'silver', 'crystal']
    }
  validates :cost_price, presence: true,
    numericality: { greater_than: 0 }

  # hooks
  before_validate :update_cost_price

  # method to evaluate cost price given a set of ingredients
  def cost_price
    ingredients.collect { |i| i.valid? ? (i.count * i.unit_cost) : 0 }.sum
  end

private

  # method to update the :cost_price parameter in the database
  def update_cost_price
    self[:cost_price] = cost_price
  end

end