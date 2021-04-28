class ChangeDataStateItem < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :state, :string
  end
end
