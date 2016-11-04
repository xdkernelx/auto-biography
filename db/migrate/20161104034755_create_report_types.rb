class CreateReportTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :report_types do |t|
      t.string :type, { limit: 32 }
      t.string :name, { limit: 64 }

      t.timestamps
    end
  end
end
