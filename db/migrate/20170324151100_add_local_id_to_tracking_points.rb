class AddLocalIdToTrackingPoints < ActiveRecord::Migration[5.0]
  def change
    add_column :tracking_points, :local_id, :string
  end
end
