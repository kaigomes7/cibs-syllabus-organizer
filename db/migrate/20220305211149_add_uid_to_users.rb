class AddUidToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uid, :string
  end
end
