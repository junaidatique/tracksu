class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column(:places, :latitude, 'float USING CAST(latitude AS float)')
    change_column(:places, :longitude, 'float USING CAST(longitude AS float)')
  end
end
