class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :calories

      t.timestamps
    end

    add_index :ingredients, :name, unique: true

    create_table :ingredients_shakes, id: false do |t|
      t.belongs_to :shake, null: false
      t.belongs_to :ingredient, null: false
    end
  end
end
