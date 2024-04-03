class AddStatusToSchedule < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules, :status, :string, default: 'Idle'
  end
end
