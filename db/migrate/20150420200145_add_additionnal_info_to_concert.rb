class AddAdditionnalInfoToConcert < ActiveRecord::Migration
  def change
    add_column :concerts, :additionnal_info, :string
  end
end
