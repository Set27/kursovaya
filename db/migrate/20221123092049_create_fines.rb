class CreateFines < ActiveRecord::Migration[7.0]
  def change
    create_table :fines do |t|
      t.date :date_of_recepeit
      t.string :article
      t.integer :amount
      t.date :date_of_payment
      t.references :registation_info, null: false, foreign_key: true

      t.timestamps
    end
  end
end
