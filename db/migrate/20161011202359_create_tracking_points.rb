class CreateTrackingPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :tracking_points do |t|
      t.references :activity, foreign_key: true
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
