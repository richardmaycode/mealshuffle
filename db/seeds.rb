# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

TRAITS = {
  protein: %w[chicken beef tofu greek_yogurt beans sausage turkey ham bacon],
  carbohydrate: %w[Potatoes Pasta bread rice mac_&_cheese],
  cuisine: %w[american italian mexican japanese korean thai chinese indian],
  meal: %w[breakfast lunch dinner snack dessert]
}

TRAITS.each do |trait, values|
  values.each do |value|
    Trait.find_or_create_by!(name: value, category: trait.to_sym)
  end
end

# For example, to create a new user:
# User.create!(name: 'John Doe', email: 'john@example.com')
