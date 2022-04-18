class AddSchoolAndDepartmentColumnToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :school, :string
    add_column :courses, :department, :string
  end
end
