class AddUserToTrackingPoints < ActiveRecord::Migration[5.0]
  def change
    add_reference :tracking_points, :user, foreign_key: true
  end
end
