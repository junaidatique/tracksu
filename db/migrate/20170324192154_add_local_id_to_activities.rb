class AddLocalIdToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :local_id, :string
  end
end
