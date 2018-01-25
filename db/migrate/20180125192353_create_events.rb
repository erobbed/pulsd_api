class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.time :start
      t.time :end

      t.timestamps
    end
  end
end
