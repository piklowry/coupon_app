class Categorie < ActiveRecord::Base
	has_many :coupons
	has_many :users, => :through => :coupons
end

