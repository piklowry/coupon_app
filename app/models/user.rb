class User < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	validates :username, presence: true
	has_many :coupons
	has_many :categories, :through => :coupons
	accepts_nested_attributes_for :coupons
	has_secure_password
	validates_presence_of :email
	validates_uniqueness_of :email
end
