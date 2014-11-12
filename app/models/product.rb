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

  # hooks
  before_save :update_cost

  # method to evaluate cost price given a set of ingredients
  def cost_price
    ingredients.collect { |i| i.valid? ? (i.count * i.unit_cost) : 0 }.sum
  end

private

  # method to update the :cost_price parameter in the database
  def update_cost
    self[:cost_price] = cost_price
  end

end