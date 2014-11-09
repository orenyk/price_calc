class Product < ActiveRecord::Base
  has_and_belongs_to_many :components
  belongs_to :category
end
