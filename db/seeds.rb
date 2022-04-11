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
        :classification => info[1],
        :class_period_day_of_week => info[2],
        :class_period_timetable => info[3],
        :credit => info[4],
        :professor => info[5],
        :ratio_exam => info[6],
        :ratio_attendance => info[7],
        :ratio_assignment => info[8],
        :image_professor => info[9],
        :image_background => info[10],
        :syllabus_url => info[11],
        :textbook => info[12]
end
