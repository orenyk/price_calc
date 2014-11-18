class Report
  # use ActiveRecord validations
  include ActiveModel::Validations

  attr_accessor :line, :categories, :product_sets, :materials, :prices
end