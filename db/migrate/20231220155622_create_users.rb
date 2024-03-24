class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :password
      t.boolean :role

      t.timestamps
    end
  end
end
