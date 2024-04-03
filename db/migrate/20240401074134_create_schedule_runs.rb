class CreateScheduleRuns < ActiveRecord::Migration[7.0]
  def change
    create_table :schedule_runs do |t|
      t.string :name
      t.references :format, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
