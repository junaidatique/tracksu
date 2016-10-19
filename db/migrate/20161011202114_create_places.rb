class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.references :companies, foreign_key: true
      t.string :name
      t.string :type
      t.string :latitude
      t.string :longitude
      t.integer :external_id

      t.timestamps
    end
  end
end
