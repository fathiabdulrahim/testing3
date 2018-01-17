class CreateListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :list_items do |t|
      t.integer :list_id
      t.string :title
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
