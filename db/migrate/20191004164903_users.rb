class Users < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.sting :email
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
