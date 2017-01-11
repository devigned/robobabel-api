class TokenAuthCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table(:users) do |t|
      t.string :provider, :null => false, :default => 'github'
      t.string :uid, :null => false, :default => ''
      t.string :name
      t.string :nickname
      t.string :image
      t.string :email
      t.string :provider_token
      t.json :provider_info
      t.timestamps
    end

    add_index :users, :email
    add_index :users, [:uid, :provider],     :unique => true
  end
end
