class CreateStrolls < ActiveRecord::Migration[7.1]
  def change
    create_table :strolls do |t|
      t.string :appointment_date
      t.belongs_to :dogsitter, index: true
      t.belongs_to :dog, index: true


      t.timestamps
    end
  end
end
