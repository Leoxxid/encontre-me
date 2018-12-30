class CreateUserInformationTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_information_types do |t|
      t.references :user, foreign_key: true
      t.references :information_type, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
