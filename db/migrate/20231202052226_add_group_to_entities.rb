class AddGroupToEntities < ActiveRecord::Migration[7.1]
  def change
    add_column :entities, :groups, :text
  end
end
