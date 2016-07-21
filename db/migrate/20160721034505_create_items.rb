class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :info

      t.timestamps null: false
    end
  end
end
