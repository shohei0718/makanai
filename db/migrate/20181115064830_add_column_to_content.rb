class AddColumnToContent < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :heading, :string,null: false
    add_column :contents, :shop, :string,null: false
    add_column :contents, :prefecture, :string,null: false
    add_column :contents, :city, :string,null: false
    add_column :contents, :detail, :string,null: false
    add_column :contents, :genre, :string,null: false
    add_column :contents, :description, :text,null: false
    add_column :contents, :qualification, :text,null: false
    add_column :contents, :workTime, :text,null: false
    add_column :contents, :salary, :string,null: false
    add_column :contents, :experience, :text,null: false
  end
end
