class ReviseCoursesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :ratio_assignment, :integer
    add_column :courses, :image_background, :string
    rename_column :courses, :difficulity, :average_difficulity
    rename_column :courses, :fun, :average_fun
    rename_column :courses, :image_name, :image_professor
  end
end
