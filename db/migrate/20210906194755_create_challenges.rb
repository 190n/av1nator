class CreateChallenges < ActiveRecord::Migration[6.1]
  def change
    create_table :challenges do |t|
      t.string :title
      t.integer :max_size
      t.datetime :deadline
      t.datetime :voting_deadline
      t.datetime :start
      t.string :rules

      t.timestamps
    end
  end
end
