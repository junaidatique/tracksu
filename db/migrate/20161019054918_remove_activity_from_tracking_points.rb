class RemoveActivityFromTrackingPoints < ActiveRecord::Migration[5.0]
  def change
    remove_column :tracking_points, :activity_id
  end
end
