require 'sqlite3'
# http://www.rubydoc.info/gems/sqlite3/1.3.10
require 'pry'
# select a database, or create it if it does not yet exist
db = SQLite3::Database.new "rolodex.db"

# if this is the first time running the code this table will be created, otherwise this step will be skipped
rows = db.execute <<-SQL
create table if not exists friends (
  ID INTEGER PRIMARY KEY,
  name TEXT,
  phone INTEGER
  );
  SQL

  # the meat and potatoes
  puts "what would you like to do? (C)reate, (R)ead, (U)pdate, or (D)estroy?"
  response = gets.chomp.downcase
  # create an entry
  if response == 'c'
  puts "person's name, please"
  name = gets.chomp.downcase
  puts "person's phone number, please"
  phone = gets.chomp
  # the actual code to insert the new entry
  db.execute("INSERT INTO friends (name, phone) VALUES (?, ?)", name, phone)
  # since the entry automatically happens at the end of the table, we can now select the last entry and display it so the user can see that their entry worked.
  person = db.execute("SELECT MAX(id) AS ID, name, phone FROM friends")
  puts "#{name}'s number is #{phone}"
  end

  # look everyone up
  if response == 'r'
  # grab only the name and phone number of everyone and display them
  all = db.execute("SELECT * FROM friends")
  all.each do |entry|
   puts "#{entry[1]}'s number is #{entry[2]}"
  end
  end
  