class AddTextInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :textbook, :string
  end
end
