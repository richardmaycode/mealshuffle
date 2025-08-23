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
  carbohydrate: %w[potatoes pasta bread rice mac_&_cheese],
  cuisine: %w[american italian mexican japanese korean thai chinese indian],
  meal: %w[breakfast lunch dinner snack dessert]
}

RECIPES = [
  { name: "BBQ Bacon Cheeseburger Bowls", traits: %w[beef american dinner potatoes] },
  { name: "Basil Pesto Chicken & Risotto", traits: %w[italian american dinner rice] },
  { name: "Cheesy Cajun Rice", traits: %w[sausage american dinner rice] },
  { name: "Chicken Parm Bowl", traits: %w[chicken italian dinner pasta] },
  { name: "Chicken Parm Cheesy Bread", traits: %w[chicken italian dinner bread] },
  { name: "Club sliders", traits: %w[turkey ham bacon american lunch dinner bread] },
  { name: "Creamy Chicken Broccoli Bake", traits: %w[chicken american dinner rice] },
  { name: "Creamy Chicken Casserole ", traits: %w[chicken american dinner] },
  { name: "Garlic Bread Dip", traits: %w[chicken italian dinner] },
  { name: "Garlic Parm Chicken Bites", traits: %w[chicken italian dinner potatoes] },
    { name: "Honey BBQ Bowls", traits: %w[chicken american dinner potatoes] },
    { name: "Honey Garlic Lo Mein", traits: %w[chicken chinese dinner pasta] },
    { name: "KFC Bowl", traits: %w[chicken american dinner potatoes] },
    { name: "Loaded Alfredo Fries", traits: %w[chicken italian dinner potatoes] },
    { name: "Loaded Animal Fries", traits: %w[beef american dinner potatoes] },
    { name: "Loaded Twice Baked Potato", traits: %w[chicken american dinner potatoes] },
    { name: "Million Dollar Spaghetti", traits: %w[beef italian dinner pasta] },
    { name: "Pesto Chicken and Veggies", traits: %w[chicken italian dinner] },
    { name: "Philly Cheesesteak Fries", traits: %w[beef american dinner potatoes] },
    { name: "Sheet Pan BBQ Meatloaf", traits: %w[beef american dinner potatoes] },
    { name: "Shredded BBQ Chicken Bowls", traits: %w[chicken american dinner mac_&_cheese] },
    { name: "Slow Cooker Pesto Mozzarella Pasta", traits: %w[chicken italian dinner pasta] },
    { name: "Southwest Street Taco Bowl ", traits: %w[chicken mexican dinner potatoes] },
    { name: "Southwestern Alfredo Bowls", traits: %w[chicken italian dinner pasta] },
    { name: "Spicy Chicken and Rice", traits: %w[chicken american dinner rice] },
    { name: "Walking Taco Bowl", traits: %w[beef mexican dinner rice] },
    { name: "White Chicken Lasagna", traits: %w[chicken italian dinner pasta] }
]

TRAITS.each do |trait, values|
  values.each do |value|
    Trait.find_or_create_by!(name: value.split("_").join(" ").titleize, category: trait.to_sym)
  end
end

User.create(email_address: "user@example.com", password: "password")

RECIPES.each do |recipe|
  puts "Creating recipe: #{recipe[:name]}"
  new_recipe = Recipe.find_or_create_by!(name: recipe[:name], servings: 1, creator: User.first)
  recipe[:traits].each do |trait|
    puts "Adding trait: #{trait}"
    new_recipe.traits << Trait.find_or_create_by!(name: trait.split("_").join(" ").titleize)
  end
end

# For example, to create a new user:
# User.create!(name: 'John Doe', email: 'john@example.com')
