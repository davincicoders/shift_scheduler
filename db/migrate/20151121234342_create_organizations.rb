class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone_number
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
