class CreateCompletedTests < ActiveRecord::Migration[6.0]
  def change
    create_table :completed_tests do |t|

      t.timestamps
    end

    add_reference(:completed_tests, :user, foreign_key: true)
    add_reference(:completed_tests, :test, foreign_key: true)
  end
end
