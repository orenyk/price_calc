class Component < ActiveRecord::Base
  has_many :manifests
  belongs_to :component_category
end
