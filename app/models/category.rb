class Category < ActiveRecord::Base
  has_many  :accumulations
end
