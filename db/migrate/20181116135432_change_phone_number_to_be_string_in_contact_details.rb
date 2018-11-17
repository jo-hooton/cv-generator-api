class ChangePhoneNumberToBeStringInContactDetails < ActiveRecord::Migration[5.2]
  def change
    change_column :contact_details, :phone_number, :string
  end
end
