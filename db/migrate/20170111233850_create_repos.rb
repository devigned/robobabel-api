class CreateRepos < ActiveRecord::Migration[5.0]
  def change
    create_table :repos do |t|
      t.integer :github_id
      t.string :name
      t.string :full_name
      t.string :description
      t.boolean :private
      t.string :language
      t.string :homepage
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :repos, :name
    add_index :repos, :github_id
  end
end
