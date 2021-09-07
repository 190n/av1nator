class AddChallengeToSubmissions < ActiveRecord::Migration[6.1]
  def change
    add_reference :submissions, :challenge, null: false, foreign_key: true
  end
end
