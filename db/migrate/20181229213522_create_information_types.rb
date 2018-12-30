class CreateInformationTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :information_types do |t|
      t.string :description
      t.integer :active

      t.timestamps
    end
  end
end
