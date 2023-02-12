class CreateTrainDates < ActiveRecord::Migration[7.0]
  def change
    create_table :train_dates, id: :uuid do |t|
      t.string :date, null: false, default: ""
      t.integer :count, null: false, default: 0
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
