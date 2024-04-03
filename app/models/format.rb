class Format < ApplicationRecord
  has_many :format_lines
  has_many :schedule_runs
end
