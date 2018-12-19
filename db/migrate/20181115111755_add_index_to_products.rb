class AddIndexToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :present, :string,null: false
    add_column :contents, :jobTime, :string,null: false
    add_column :contents, :user_id, :integer,null: false
  end
end
