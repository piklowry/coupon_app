class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :title
      t.string :description
      t.string :company_name
      t.string :address
      t.string :sale_offer
      t.integer :user_id

      t.timestamps
    end
  end
end
