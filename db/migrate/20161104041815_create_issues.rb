class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :title, { limit: 64 }
      t.string :description
      t.integer :urgency

      t.timestamps
    end
  end
end
