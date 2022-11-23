class CreateCarHolderInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :car_holder_infos do |t|
      t.string :full_name
      t.date :date_of_birth
      t.date :date_of_car_license

      t.timestamps
    end
  end
end
