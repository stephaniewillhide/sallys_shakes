unless User.exists?(email: "sally@example.com")
  User.create!(name: "Sally", email: "sally@example.com", password: "password")
end

ingredients = [
  ["Banana", 105],
  ["Half and Half", 400],
  ["Hershey's Syrup", 130],
  ["Ice Cream", 300],
  ["Oreos", 140],
  ["Peanut Butter", 190],
  ["Strawberries", 70]
].map do |name, calories|
  Ingredient.find_or_create_by(name: name, calories: calories)
end

[
  ["Strawberry", ["Half and Half", "Ice Cream", "Strawberries"]],
  ["Strawberry Banana", ["Banana", "Half and Half", "Ice Cream", "Strawberries"]],
  ["Peanut Butter Banana", ["Banana", "Half and Half", "Ice Cream", "Peanut Butter"]],
  ["Buckeye Blitz", ["Banana", "Half and Half", "Hershey's Syrup", "Ice Cream", "Oreos", "Peanut Butter"]],
].each do |name, ingredient_names = []|
  shake = Shake.find_or_create_by(name: name)
  matching_ingredients = ingredients.select { |ingredient| ingredient_names.include?(ingredient.name) }
  shake.update(ingredients: matching_ingredients)
end
