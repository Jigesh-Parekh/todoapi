class AddCompleteToItems < ActiveRecord::Migration
  def change
    add_column :items, :complete, :string
  end
end
