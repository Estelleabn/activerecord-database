require 'sqlite3'

# creates the database
db_path = "db/cookbook.sqlite"
db = SQLite3::Database.new(db_path)

# creates the schema of the database
# your code here
sql = %q{ CREATE TABLE IF NOT EXISTS Recipe(
	 	id INTEGER primary key autoincrement,
		name VARCHAR(255),
	  	description VARCHAR(255),
	  	length INTEGER,
	  	difficulty INTEGER
		)
}

db.execute(sql)

#*************************************

# function to create a recipe
def create_recipe(db,name,description,length,difficulty)
  sql  = "INSERT INTO Recipe (name, description, length, difficulty) VALUES ('#{name}','#{description}',#{length},#{difficulty})"
  p sql
  db.execute(sql)
  "Congrats! Your #{name} recipe was created successfully"
end

# function to delete a recipe
def delete_recipe(db,id)
  db.execute("DELETE FROM Recipe WHERE name='#{id}'")
  puts "Your #{id} recipe was deleted successfully"
end

# function to delete all recipes
def delete_all_recipes(db)
  db.execute("DELETE FROM Recipe;")
end

# function to update a recipe
def update_recipe(db,id,description)
  db.execute("UPDATE Recipe SET description='#{description}' WHERE name='#{id}'")
end

def get_recipes(db)
  puts db.execute("SELECT name FROM Recipe")
end

def read_recipes(db)
  puts db.execute("SELECT name FROM Recipe")
end


#*************************************

# program



while true
  puts "Salut Robuchon, what do you want to do today?"
  puts "1. create a recipe"
  puts "2. delete all recipes"
  puts "3. delete only one recipe"
  puts "4. read your recipes"
  puts "5. update one recipe"
  puts "6. exit"

  choice =  gets.chomp.to_i

  case choice
    when 1
      puts "Which recipe do you wanna create ?"
      name = gets.chomp
      puts "How do you cook it ?"
      description = gets.chomp
      puts "How long does it take to cook it ?"
      length = gets.chomp.to_i
      puts "Is it difficult to cook ? Select a number between 1 and 5."
      difficulty = gets.chomp.to_i
      create_recipe(db, name, description, length, difficulty)
  when 2
      delete_all_recipes(db)
      puts "Your recipes list is now empty"
  when 3
      puts "Which recipe do you wanna delete ?"
      id = gets.chomp
      delete_recipe(db, id)
  when 4
  	puts "Here are all your recipes available :"
  	read_recipes(db)
  when 5
  	puts "Which recipe do you wanna update"
  	id = gets.chomp
  	puts "Write your description"
  	description = gets.chomp
  	update_recipe(db, id, description)
  when 6
      break 
  end
end
  
  
  
  
  
  
  
  