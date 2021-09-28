class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :postcode, null: false
      t.integer :prefecture, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building, null: false
      t.string :phone_number, null: false
      t.references :purchase, foreign_key: true

      t.timestamps
    end
  end
end
