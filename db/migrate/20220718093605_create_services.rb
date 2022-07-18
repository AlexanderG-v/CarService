class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :title, null: false
      t.references :order, :category, :executor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
