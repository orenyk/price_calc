class Report
  include ActiveModel::Model
  # use ActiveRecord validations
  include ActiveModel::Validations

  attr_accessor :product_line_ids, :category_ids, :product_set_ids,
    :material_ids, :price_ids, :enable_vat

end