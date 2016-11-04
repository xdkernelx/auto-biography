class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.integer :vin
      t.integer :user_id
      t.integer :mileage

      t.timestamps
    end
  end
end
