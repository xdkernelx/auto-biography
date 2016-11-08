class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|

      t.timestamps
    end
  end
end
