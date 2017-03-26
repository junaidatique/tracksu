class AddLocalIdToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :local_id, :string
  end
end
