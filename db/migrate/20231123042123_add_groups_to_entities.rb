class AddGroupsToEntities < ActiveRecord::Migration[7.0]
  def change
    add_column :entities, :groups, :text
  end
end
