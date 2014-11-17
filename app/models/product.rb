class Product < ActiveRecord::Base

  # associations
  belongs_to :category
  belongs_to :family
  belongs_to :material
  has_many :ingredients

  # validations
  validates_presence_of :category
  validates_presence_of :family
  validates_presence_of :material
  validates :name, presence: true
  validates :line, presence: true,
    inclusion: { in: ['juditb', 'jb'] }
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