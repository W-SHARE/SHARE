class AddNewColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :school_grade, :string
    add_column :courses, :class_period_semester, :string
    add_column :courses, :image_icon, :string
    add_column :courses, :classroom, :string
    add_column :courses, :campus, :string
  end
end
