# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Configuration.delete_all
ScheduleRun.delete_all
ScheduleLine.delete_all
Schedule.delete_all
FormatLine.delete_all
Format.delete_all

ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'formats'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'format_lines'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'schedules'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'schedule_lines'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'schedule_runs'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'configurations'")

format = Format.create(name: 'sample format')

FormatLine.create(name: 'format line 1', format: format)
FormatLine.create(name: 'format line 2', format: format)
FormatLine.create(name: 'format line 3', format: format)


schedule = Schedule.create(name: 'sample schedule', format: format)

ScheduleLine.create(name: 'schedule line 1', schedule: schedule)
ScheduleLine.create(name: 'schedule line 2', schedule: schedule)
ScheduleLine.create(name: 'schedule line 3', schedule: schedule)

ScheduleRun.create(name: 'schedule run 1', format: format, schedule: schedule)

Configuration.create(format_line: 'format line 11')
Configuration.create(format_line: 'format line 12')
Configuration.create(format_line: 'format line 13')