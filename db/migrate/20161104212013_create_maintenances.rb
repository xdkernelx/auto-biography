class CreateMaintenances < ActiveRecord::Migration[5.0]
  def change
    create_table :maintenances do |t|

      t.timestamps
    end
  end
end
