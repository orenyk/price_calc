class Product < ActiveRecord::Base

  # associations
  belongs_to :category
  belongs_to :product_set
  belongs_to :material
  has_many :ingredients, dependent: :destroy

  # validations
  validates_presence_of :category
  validates_presence_of :product_set
  validates_presence_of :material
  validates :name, presence: true, uniqueness: true
  validates :cost_price, presence: true,
    numericality: { greater_than_or_equal_to: 0 }

  # hooks
  before_validation :update_cost_price

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