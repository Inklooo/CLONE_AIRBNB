class AddCoordinatesToCottages < ActiveRecord::Migration[7.1]
  def change
    add_column :cottages, :latitude, :float
    add_column :cottages, :longitude, :float
  end
end
