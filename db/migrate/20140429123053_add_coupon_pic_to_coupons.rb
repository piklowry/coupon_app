class AddCouponPicToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :coupon_pic, :string
  end
end
