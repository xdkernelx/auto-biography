class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :report_type_id
      t.integer :ticket_id
      t.integer :user_id
      # t.integer :shop_id
      t.string :title, { limit: 64 }
      t.string :description
      t.string :mechanic_notes, default: ""
      t.integer :rating, default: 0
      t.date :date_completed

      t.timestamps
    end
  end
end
