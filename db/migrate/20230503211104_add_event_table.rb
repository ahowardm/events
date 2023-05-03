class AddEventTable < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.date :date, null: false
      t.references :venue
      t.references :category
    end
  end
end
