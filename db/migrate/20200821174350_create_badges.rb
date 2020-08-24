class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :image
      t.string :rule
      t.string :option

      t.timestamps
    end
  end
end
