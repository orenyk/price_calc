class Product < ActiveRecord::Base
  has_many :manifests
  belongs_to :category

  before_save :update_cost

  def cost
    manifests.collect { |m| m.valid? ? (m.count * m.unit_cost) : 0 }.sum
  end

  private

  def update_cost
    self[:cost] = cost
  end
end
