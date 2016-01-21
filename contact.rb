

# Represents a person in an address book.
class Contact < ActiveRecord::Base

  # attr_accessor :name, :email

  # def initialize(name, email)
  #   # TODO: Assign parameter values to instance variables.
  #   @name = name
  #   @email = email
  # end

  # def self.connection
   
  #   # conn = PG.connect(
  #   # host: 'localhost',
  #   # dbname: 'contactlist',
  #   # user: 'development',
  #   # password: 'development'
  #   # )
  # end

  # Provides functionality for managing a list of Contacts in a database.
  # class << self

  #   # Returns an Array of Contacts loaded from the database.
  #   def all
  #     # TODO: Return an Array of Contact instances made from the data in 'contacts.db?'.
  #     # puts "id" + "\t" + "name" + "\t\t" + "e-mail"
  #     # puts "--------------------------------------"
  #     conn = connection
  #     contacts_array = []

  #     conn.exec('SELECT * FROM contacts;') do |results|
  #       # results is a collection (array) of records (hashes)
  #       results.each do |contact|
  #         contacts_array << contact
  #       end
  #     end
  #     conn.close  
  #     contacts_array
  #   end

  #   # Creates a new contact, adding it to the database, returning the new contact.
  #   def create(name, email)
  #     # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
  #     last_id = connection.exec('SELECT id FROM contacts ORDER BY id DESC LIMIT 1;')[0]["id"].to_i
  #     save(last_id+1,name,email)      
  #     last_id+1
  #   end

  #   def save(id, name, email)
  #     conn = connection
  #     if find(id) != nil
  #     conn.exec("UPDATE contacts SET name = '#{name}',email = '#{email}' WHERE id = #{id};")
  #     conn.close
  #     else
  #     conn.exec("INSERT INTO contacts VALUES (#{id},'#{name}','#{email}');")
  #     conn.close
  #     end
  #     id
  #   end

  #   #Returns the contact with the specified id. If no contact has the id, returns nil.
  #   def find(id)
  #     # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
  #     conn = connection
  #     result = conn.exec("SELECT * FROM contacts WHERE id = #{id};") 
  #     if result.ntuples() > 0
  #       conn.close
  #       return result[0]
  #     else
  #       conn.close
  #       nil
  #     end   
  #   end

  #   # Returns an array of contacts who match the given term.
  #   def search(term)
  #     # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
  #     conn = connection
  #     contacts_array = []

  #     conn.exec("SELECT * FROM contacts WHERE name LIKE '%#{term}%' OR email LIKE '%#{term}%'; ") do |results|
  #       # results is a collection (array) of records (hashes)
  #       results.each do |contact|
  #         contacts_array << contact
  #       end
  #     end
  #     conn.close  
  #     contacts_array
  #   end

  #   def destroy(id)
  #     # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
  #     conn = connection
  #     conn.exec("DELETE FROM contacts WHERE id = #{id}; ") 
  #     id
  #   end

  # end #meta class end
end # class end