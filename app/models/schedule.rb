class Schedule < ApplicationRecord
  belongs_to :format
  has_many :schedule_lines
  has_many :schedule_runs, autosave: false
end
