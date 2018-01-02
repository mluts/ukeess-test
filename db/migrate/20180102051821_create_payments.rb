class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.belongs_to :customer, foreign_key: true, null: false
      t.decimal :amount, precision: 15, scale: 2, null: false
      t.string :check_number
    end
  end
end
