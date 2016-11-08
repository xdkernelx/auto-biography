class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :title, { limit: 64 }
      t.string :body
      t.integer :commentable_id

      t.timestamps
    end
  end
end
