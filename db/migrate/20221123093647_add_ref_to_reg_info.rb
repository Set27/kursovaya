class AddRefToRegInfo < ActiveRecord::Migration[7.0]
  def change
    change_table :registation_infos do |t|
      t.references :car_info, null: false, foreign_key: true
    end
  end
end
