class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.date :activity_date
      t.string :type
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration
      t.string :activity

      t.timestamps
    end
  end
end
