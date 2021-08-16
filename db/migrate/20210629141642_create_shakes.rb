class CreateShakes < ActiveRecord::Migration[6.1]
  def change
    create_table :shakes do |t|
      t.string :name

      t.timestamps
    end
  end
end
