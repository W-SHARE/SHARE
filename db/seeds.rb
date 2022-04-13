# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/course.csv', headers: true) do |row|
    Course.create(
        name: row["name"],
        classification_1: row["classification_1"],
        classification_2: row["classification_2"],
        school_grade: row["school_grade"],
        class_period_semester: row["class_period_semester"],
        class_period_day_of_week: row["class_period_day_of_week"],
        class_period_timetable: row["class_period_timetable"],
        credit: row["credit"],
        professor: row["professor"],
        ratio_exam: row["ratio_exam"],
        ratio_attendance: row["ratio_attendance"],
        ratio_assignment: row["ratio_assignment"],
        image_professor: row["image_professor"],
        image_background: row["image_background"],
        image_icon: row["image_icon"],
        syllabus_url: row["syllabus_url"],
        textbook: row["textbook"],
        classroom: row["classroom"],
        campus: row["campus"]
    )
end
