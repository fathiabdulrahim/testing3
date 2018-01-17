class CreateListTags < ActiveRecord::Migration[5.2]
  def change
    create_table :list_tags do |t|
      t.integer :tag_id
      t.integer :list_item_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
