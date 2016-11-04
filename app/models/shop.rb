class Shop < ApplicationRecord

  create_table :shops do |t|
    t.integer :owner_id
    t.string :name, { limit: 64 }
    t.string :summary
    t.string :specialties
    t.string :address, { limit: 128 }
    t.string :city, { limit: 64 }
    t.string :state, { limit: 2 }

    t.timestamps null: false
  end

end
