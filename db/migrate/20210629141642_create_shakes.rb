class CreateShakes < ActiveRecord::Migration[6.1]
  def change
    create_table :shakes do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
