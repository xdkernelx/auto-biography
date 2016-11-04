class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.string :title, { limit: 64 }
      t.string :description
      t.boolean :open, { default: true }
      t.boolean :acces, { default: false }

      t.timestamps
    end
  end
end
