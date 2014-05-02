class AddExpirationDateToCategoryModel < ActiveRecord::Migration
  def change
    add_column :coupons, :expiration_date, :datetime
  end
end
