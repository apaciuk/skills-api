class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals, id: :uuid do |t|
      t.string :name, null: false, default: ""
      t.datetime :timeframe, null: false, default: ""
      t.integer :exp, null: false, default: 0
      t.boolean :ended, null: false, default: false
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
