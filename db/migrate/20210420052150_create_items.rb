class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.integer :count
      t.string :place
      t.datetime :promise_at
      t.integer :state
      t.string :image

      t.timestamps
    end
  end
end
