class AddCounterCacheToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :comments_count, :integer, :default => 0
    add_index  :events, :comments_count
  end
end
