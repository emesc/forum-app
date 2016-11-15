class AddPublishedOnToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :published_on, :date
  end
end
