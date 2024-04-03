class ScheduleRun < ApplicationRecord
  belongs_to :format
  belongs_to :schedule
end
