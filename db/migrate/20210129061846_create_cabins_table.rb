class CreateCabinsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :cabins do |t|
        t.column :address, :string, limit: 50
        t.column :description, :string, limit: 300
    end
  end
end
