class Product < ActiveRecord::Base
  has_many: :components
  belongs_to: :category
end
