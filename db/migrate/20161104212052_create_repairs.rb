class CreateRepairs < ActiveRecord::Migration[5.0]
  def change
    create_table :repairs do |t|
      t.integer :issue_id
      # t.integer :repairable_id
      t.string :title, { limit: 64 }
      t.string :description
      t.integer :mileage
      t.integer :shop_id
      t.date :date_completed
      t.integer :rating

      t.timestamps
    end
  end
end
