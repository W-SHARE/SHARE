class AddSylabasColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :syllabus_url, :string
  end
end
