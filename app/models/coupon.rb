class Coupon < ActiveRecord::Base
	validates :company_name, presence: true
	validates :title, presence: true
	validates :description, presence: true
	validates :sale_offer, presence: true
	
	belongs_to :user
	has_many :categories, :through => :user
	
	mount_uploader :coupon_pic, CouponPicUploader

	def self.expires_after(date)
		where('expiration_date > ?' , date)
	end

	# def self.categories_search(kind_of_coupon)
	# 	joins(:categories).where('categories.kind_of_coupon LIKE ?' , kind_of_coupon)
	# end



	def self.ending_soon
		where('expiration_date > ? AND expiration_date  < ? ' , Date.today , 3.days.from_now)
	end


def self.search(params)
		name = params[:search]
		date = params[:expiration_date]
		kind_of_coupon = params[:kind_of_coupon]

	  search = Coupon.all
		if name.present?
    	search = search.where('coupons.title LIKE ?', "%#{name}%")
    	
		end

		if date.present?
			search = search.expires_after(date)
			
		end

		if kind_of_coupon.present?
			search = search.categories_search(kind_of_coupon)
			
		end
		search
	end

end

