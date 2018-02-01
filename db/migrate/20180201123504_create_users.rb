class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.boolean :active, default: false
      t.boolean :admin, default: false
      t.string :password_hash, null: false
      t.string :password_salt, null: false
      t.timestamps
    end

    add_index :users, :name, unique: true
    add_index :users, :email, unique: true

  end
end
