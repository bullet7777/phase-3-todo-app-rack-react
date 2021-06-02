puts "Clearing old data..."
Category.destroy_all
Task.destroy_all

puts "Seeding Categories..."

# create categories
category_1=Category.create(name:"Food")
Category.create(name:"Misc")
Category.create(name:"Code")
Category.create(name:"Money") 

puts "Seeding tasks..."

# create tasks
Task.create(text:"eat healtjhy",category_id:category_1.id)

puts "Done!"