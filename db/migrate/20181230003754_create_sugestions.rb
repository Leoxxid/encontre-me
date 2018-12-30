class CreateSugestions < ActiveRecord::Migration[5.2]
  def change
    create_table :sugestions do |t|
      t.integer :flag
      t.references :user, foreign_key: true
      t.references :user_information_type, foreign_key: true

      t.timestamps
    end
  end
end
