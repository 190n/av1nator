class RemoveDateFromSubmissions < ActiveRecord::Migration[6.1]
  def change
    remove_column :submissions, :date, :datetime
  end
end
