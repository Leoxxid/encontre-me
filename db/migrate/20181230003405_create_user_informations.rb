class CreateUserInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_informations do |t|
      t.string :description
      t.integer :flag
      t.references :user_information_type, foreign_key: true

      t.timestamps
    end
  end
end
