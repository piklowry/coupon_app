class Coupon < ActiveRecord::Base
	validates :company_name, presence: true
	validates :title, presence: true
	validates :description, presence: true
	validates :sale_offer, presence: true
	belongs_to :user
	has_many :categories, :through => :users
	mount_uploader :coupon_pic, CouponPicUploader
end

