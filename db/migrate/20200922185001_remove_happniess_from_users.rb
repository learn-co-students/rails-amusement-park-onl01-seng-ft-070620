class RemoveHappniessFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :happniess
  end
end
