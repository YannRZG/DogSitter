class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.belongs_to :dogsitter
      t.belongs_to :dog
      t.timestamps
    end
  end
end
