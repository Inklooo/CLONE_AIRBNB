class CreateCottages < ActiveRecord::Migration[7.1]
  def change
    create_table :cottages do |t|
      t.string :name
      t.string :address
      t.text :description
      t.float :price
      t.boolean :availability
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
