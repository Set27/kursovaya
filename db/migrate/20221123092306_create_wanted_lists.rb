class CreateWantedLists < ActiveRecord::Migration[7.0]
  def change
    create_table :wanted_lists do |t|
      t.string :state_number
      t.text :description
      t.references :car_info, null: false, foreign_key: true

      t.timestamps
    end
  end
end
