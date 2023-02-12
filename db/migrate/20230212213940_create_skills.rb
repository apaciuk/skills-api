class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills, id: :uuid do |t|
      t.string :name, null: false, default: ""
      t.float :level, null: false, default: 0.0
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.datetime :last_train, null: false, default: ""

      t.timestamps
    end
  end
end
