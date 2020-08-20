class CreateActivitiesPurposesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :activities_purposes do |t|
      t.references :activity, :purpose
    end
  end
end
