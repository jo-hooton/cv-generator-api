class CreateContactDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_details do |t|
      t.string :address
      t.integer :phone_number
      t.integer :cv_id

      t.timestamps
    end
  end
end
