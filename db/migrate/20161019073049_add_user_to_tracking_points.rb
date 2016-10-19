class AddUserToTrackingPoints < ActiveRecord::Migration[5.0]
  def change
    add_reference :tracking_points, :users, foreign_key: true
  end
end
