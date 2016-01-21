require 'pg'

puts 'Connecting to the database...'
conn = PG.connect(
host: 'localhost',
dbname: 'contactlist',
user: 'development',
password: 'development'
)

 contacts_array = [5]

    puts   conn.exec("SELECT * FROM contacts;")[0]

puts 'DONE'
