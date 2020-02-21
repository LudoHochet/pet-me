class AddDefaultValueStatusPets < ActiveRecord::Migration[6.0]
  def change
    change_column :pets, :status, :boolean, default: true
  end
end
