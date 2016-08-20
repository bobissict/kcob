class AddHouseToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :house, :string
  end
end
