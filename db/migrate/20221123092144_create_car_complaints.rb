class CreateCarComplaints < ActiveRecord::Migration[7.0]
  def change
    create_table :car_complaints do |t|
      t.string :address
      t.text :description
      t.date :date
      t.references :registation_info, null: false, foreign_key: true

      t.timestamps
    end
  end
end
