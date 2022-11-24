class RemoveStateNumberFromWantedListAddIndex < ActiveRecord::Migration[7.0]
  def change
    remove_column :wanted_lists, :state_number
  end
end
