class Application
 
  def initialize
    # Start with an empty array of contacts.
    # TODO: Perhaps stub (seed) some contacts so we don't have to create some every time we restart the app
    @contacts = []
  end
 
  def run
    show_main_menu
    input = gets.chomp

    case input

      when "new"
        new_contact

      when "list"
        list_contacts

      else
      puts "Please choose a valid option."

    end
  end

  def new_contact
    puts "What is your contact's full name?"
    name = gets.chomp
    puts "What is your contact's email?"
    email = gets.chomp
    contact = Contact.new(name, email)
    @contacts.push(contact)
    run
  end


  def list_contacts
    @contacts.each do |contact|
      puts contact.to_s
    end
    run
  end
     


  def quit
    puts "Bye!"
  end
  
  # Prints the main menu only
  def show_main_menu
    puts "Welcome to the app. What's next?"
    puts " new      - Create a new contact"
    puts " list     - List all contacts"
    puts " show :id - Display contact details"
    puts " quit     - Quits this program"
    print "> "
  end
 
end
