# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dogs = [
  {
    name: 'Bowie',
    description: 'Bowie dances when he walks'
  },


  {
    name: 'Brownie',
    description: 'Brownie only sits pretty'
  },
  {
    name: 'Jax',
    description: '',
  },
  {
    name: 'Jiro',
    description: 'Jiro takes a long time to destroy his toys'
  },
  {
    name: 'Pete',
    description: 'Pete has a best friend named Lua'
  },
  {
    name: 'Bijou',
    description: 'Bijou is the fluffiest of them all'
  },
    {
    name: 'Britta',
    description: 'Britta has two different colored eyes'
  },
  {
    name: 'Noodle',
    description: 'Noodle is an Instagram celebrity'
  },
  {
    name: 'Stella',
    description: 'Stella loves to dig'
  },
  {
    name: 'Tonks',
    description: 'Tonks loves to run'
  },
]
dogs.each do |dog|
  dog = Dog.find_or_create_by(name: dog[:name], description: dog[:description])
  #p dog
  p "Dog: #{dog.name}"
  directory_name = File.join(Rails.root, 'db', 'seed', "#{dog[:name].downcase}", "*")
  p "directory_name #{directory_name}"
  Dir.glob(directory_name).each do |filename|
    p "Filename: #{filename}"
    if !dog.images.any?{|i| i.filename == filename}
      p "In attach loop: filename: #{filename}"
      dog.images.attach(io: File.open(filename), filename: filename.split("/").pop, content_type: "image/jpg")
      dog.save
      sleep 1
    end
  end
end


#users
users = [{name: 'Keri'},{name: 'Renee'},{name: 'Eric'},{name: 'Lauren'},{name: 'Craig'},{name: 'Ken'}]
users.each do |user|
  user = User.find_or_create_by(name: user[:name])
end
