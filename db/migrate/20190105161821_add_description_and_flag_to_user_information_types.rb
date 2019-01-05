class AddDescriptionAndFlagToUserInformationTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :user_information_types, :description, :string
    add_column :user_information_types, :flag, :integer, default: 0
  end
end
