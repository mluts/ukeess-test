class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.boolean :active, null: false, default: false
      t.belongs_to :department, foreign_key: true, null: false
    end
  end
end
