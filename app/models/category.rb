class Category < ActiveRecord::Base
  has_many :articles

  #attr_accessor :category
end
