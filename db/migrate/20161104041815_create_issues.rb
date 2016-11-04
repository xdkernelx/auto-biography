class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.integer :car_id
      t.string :title, { limit: 64 }
      t.string :description
      t.boolean :open, default: false
      t.integer :urgency

      t.timestamps
    end
  end
end
