class Coupon < ActiveRecord::Base
	validates :company_name, presence: true
	validates :title, presence: true
	validates :description, presence: true
	validates :sale_offer, presence: true
	
	belongs_to :user
	has_many :categories, :through => :users
	
	mount_uploader :coupon_pic, CouponPicUploader


def self.search(params)
		name = params[:name]
	  search = Coupon.all
		if name.present?
    	search = search.where('coupons.title LIKE ?', "%#{name}%")
		end
		search
	end
end

