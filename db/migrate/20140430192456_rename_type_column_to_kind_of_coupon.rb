class RenameTypeColumnToKindOfCoupon < ActiveRecord::Migration
  def change
  	rename_column :categories, :type, :kind_of_coupon
  end
end
