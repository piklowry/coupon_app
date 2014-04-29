class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :type
      t.integer :rating
      t.boolean :availability, default: true

      t.timestamps
    end
  end
end
