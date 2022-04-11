class AddNewColumnToReviewCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :review_courses, :overall, :float
    add_column :courses, :average_overall, :float
  end
end
