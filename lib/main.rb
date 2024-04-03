def main
  puts 'starting...'

  schedule = Schedule.find(1)

  format = Format.find(1)
  format_dup = Format.new({name: format.name})

  format_lines = []

  format_lines_db =  FormatLine.where(format_id: 1)
  format_lines_db.each do |format_line|
    format_lines << format_line
  end

  config_lines = Configuration.all
  config_lines.each do |config_line|
    format_lines << FormatLine.new({name: config_line.format_line}) #ToDo
  end

  format_dup.format_lines = format_lines
  schedule_run_db = ScheduleRun.find(1)
  schedule_run = ScheduleRun.new({name: schedule_run_db.name, schedule: schedule, format: format_dup})

  schedule_run_json = schedule_run.to_json(include: {
    format: {include: :format_lines},
    schedule: {include: :schedule_lines}
  })

  puts schedule_run_json
  # this json data is being used as input payload for other http call

  schedule_run.delete

  # upon updating an attribute on schedule is also inserting new records into schedule_runs and format_lies
  # for the objects initialized above
  schedule.update_attribute(:status, 'Scheduled')
end

main if __FILE__ == $PROGRAM_NAME
