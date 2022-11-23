class CreateRegistationInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :registation_infos do |t|
      t.string :state_number
      t.date :date_of_registation
      t.references :car_holder_info, null: false, foreign_key: true

      t.timestamps
    end
  end
end
