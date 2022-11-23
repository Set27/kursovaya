class CreateCarInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :car_infos do |t|
      t.string :VIN
      t.string :brand
      t.string :model

      t.timestamps
    end
  end
end
