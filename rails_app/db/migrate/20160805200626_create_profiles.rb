class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.integer :year_matriculated
      t.integer :city
      t.integer :country
      t.integer :industry_id
      t.string :company
      t.string :position
      t.string :facebook_url
      t.string :linkedin_url
      t.string :email
      t.boolean :activated, default: false

      t.timestamps null: false
    end
  end
end
