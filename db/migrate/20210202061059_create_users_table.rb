class CreateUsersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
        t.column :username, :string
        t.column :password_digest, :string
    end
  end
end
