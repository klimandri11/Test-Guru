class AddIndexRuleOptionToBadges < ActiveRecord::Migration[6.0]
  def change
    add_index :badges, [:rule, :option], unique: true
  end
end
