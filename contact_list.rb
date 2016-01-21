require 'active_record'
require 'pg'
require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList
  #new list show search
  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  ActiveRecord::Base.establish_connection(
    adapter: :postgresql,
    host: 'localhost',
    database: 'contactlist',
    user: 'development',
    password: 'development'
  )
  case ARGV[0]
  
  when nil 
    puts "Here is a list of avaiable commands:"
    puts "new : create a new contact"
    puts "show : show a contact"
    puts "search: search a contact"
  
  when "new"
    puts "Please enter full name"
    fullname = STDIN.gets.chomp
    puts "Please enter email"
    email = STDIN.gets.chomp
    id = (Contact.order(id: :desc).limit(1))[0].id +  1
    Contact.create(id: id,name: fullname, email: email)
    puts "New contact with id #{id} created successfully!"

  when "list"
     #do |results|
    #   results.each do |contact|
    #     puts contact.inspect
    #   end
    # end
    puts "id" + "\t" + "name" + "\t\t" + "e-mail"
    contacts = Contact.all
    # puts contacts
    contacts.each  do |contact|
      puts contact.id.to_s + "\t" + contact.name + "\t" + contact.email 
    end
  
  when "show"
    id = ARGV[1]
    puts "id" + "\t" + "name" + "\t\t" + "email"
    found =  Contact.find_by(id: id)
    puts found !=nil ? found.id.to_s + "\t" + found.name + "\t" + found.email : "Contact with id not found"

  when "search"
    term = ARGV[1]
    records = 0
    puts "id" + "\t" + "name" + "\t\t" + "e-mail"
    contacts_array = Contact.find_by_sql("SELECT * FROM contacts WHERE name LIKE '%#{term}%' OR email LIKE '%#{term}%'")
    contacts_array.each  do |contact|
      records +=1
      puts contact.id.to_s + "\t" + contact.name + "\t" + contact.email 
    end
    puts "------------------------"
    puts "#{records} records total"  

  when "update"
    id = ARGV[1]
    found =  Contact.find_by(id: id)
    if found != nil
      puts "Please enter full name"
      fullname = STDIN.gets.chomp
      puts "Please enter email"
      email = STDIN.gets.chomp
      Contact.update(:id => id,:name => fullname,:email=> email)
      puts "contact with id #{id} updated successfully!"
    else
      puts  "Contact with id not found"   
    end

  when "destroy"
    id = ARGV[1]
    found =  Contact.find_by(id: id)
    if found != nil
      found.destroy
      puts "contact with id #{id} deleted successfully!"
    else
      puts  "Contact with id not found"   
    end

  else
    puts "No valid option entered"  

  end #case end

end #class end

