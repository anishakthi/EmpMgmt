class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.date :doj
      t.string :status
      t.date :dob

      t.timestamps
    end
  end
end
