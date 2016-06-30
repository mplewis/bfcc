class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.belongs_to :poll, index: true, foreign_key: true
      t.string :text

      t.timestamps null: false
    end
  end
end
