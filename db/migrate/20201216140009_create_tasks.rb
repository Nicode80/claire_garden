class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :periodicity
      t.text :content
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
