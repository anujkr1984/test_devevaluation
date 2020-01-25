class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.string :ph_number
      t.boolean :is_assign, default: false
      t.datetime :assign_date

      t.timestamps
    end
  end
end
