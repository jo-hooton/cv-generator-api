class CreateTextItems < ActiveRecord::Migration[5.2]
  def change
    create_table :text_items do |t|
      t.string :title
      t.string :content
      t.integer :cv_id

      t.timestamps
    end
  end
end
