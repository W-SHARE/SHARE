class AddImageNameToLabsAndCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :image_name, :string
    add_column :labs, :image_name, :string
  end
end
