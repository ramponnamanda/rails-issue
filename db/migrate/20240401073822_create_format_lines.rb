class CreateFormatLines < ActiveRecord::Migration[7.0]
  def change
    create_table :format_lines do |t|
      t.string :name
      t.references :format, null: false, foreign_key: true

      t.timestamps
    end
  end
end
