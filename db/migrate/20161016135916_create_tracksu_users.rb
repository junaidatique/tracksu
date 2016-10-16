class CreateTracksuUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :tracksu_users do |t|
      t.string :name
      t.string :email
      t.boolean :activated

      t.timestamps
    end
  end
end
