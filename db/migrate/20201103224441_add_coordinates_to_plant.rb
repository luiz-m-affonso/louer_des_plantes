class AddCoordinatesToPlant < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :latitude, :float
    add_column :plants, :longitude, :float
  end
end
