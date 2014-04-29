class AddCategoryIdToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :category_id, :integer
  end
end
