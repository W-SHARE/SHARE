# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/course.csv') do |info|
    Course.create(
        :name => info[0],
        :classification_1 => info[1],
        :classification_2 => info[2],
        :class_period_semester => info[3],
        :class_period_day_of_week => info[4],
        :class_period_timetable => info[5],
        :credit => info[6],
        :professor => info[7],
        :ratio_exam => info[8],
        :ratio_attendance => info[9],
        :ratio_assignment => info[10],
        :image_professor => info[11],
        :image_background => info[12],
        :image_icon => info[13],
        :syllabus_url => info[14],
        :textbook => info[15]
        :classroom => info[16],
        :campus => info[17],
end
