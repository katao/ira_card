class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.integer :rarity_id
      t.string :title
      t.text :comment

      t.timestamps
    end
  end
end
