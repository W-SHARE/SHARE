# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/course.csv') do |info|
    Course.create(:name => info[0],
        :class_period_day_of_week => info[1],
        :class_period_timetable => info[2])
end

Lab.create!(
    name: "吉田研究室",
    major: "電子エレクトロニクス",
    core_time_start_hour: 9,
    core_time_start_min: 00,
    core_time_end_hour: 18,
    core_time_end_min: 00,
    professor: "吉田銀次郎"
)
Lab.create!(
    name: "田中研究室",
    major: "パワーデバイス",
    core_time_start_hour: 12,
    core_time_start_min: 00,
    core_time_end_hour: 15,
    core_time_end_min: 00,
    professor: "田中総"
)
