class AddRef < ActiveRecord::Migration[7.0]
  def change
    change_table :wanted_lists do |t|
      t.references :registation_info, null: true, foreign_key: true
    end
    
  end
end
