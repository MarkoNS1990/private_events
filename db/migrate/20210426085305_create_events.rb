class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :user
      t.string :title
      t.string :location
      t.text :description
      t.date :date
      t.timestamps
    end
  end
end
