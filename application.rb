# How to create a variable for gets.chomp?  What about when it's gets.chomp.to_i, just add .to_i to end of
# variable name?

  # below is the class being declared.
class Application

  # The initialize method is run when a class is being instantiated (creates a new instance)
 
  def initialize

    # Creates an instance variable (denoted by @) named contacts, and sets it to an empty array.
    @contacts = []

    # every time a method is made it needs an end. comment next to end tells which statement it belongs to.

  end # def initialize
 
  # This declares a method run.
  def run
    # This calls the method show_main_menu
    show_main_menu

    # Read the input from the user, remove the trailing newline, and set that to the variable input.
    input = gets.chomp

    # Get the value of input and start a case block, where an appropriate when clause will be selected.
    case input

      # when the variable input is "new", call the new_contact method.
      when "new"
        new_contact

      when "list"
        list_contacts

      when "show"
        show_id

      when "quit"
        quit

      else
      puts "Please choose a valid option."

    end
  end

  def new_contact
    puts "What is your contact's full name?"
    # inputted info is put into the name variable, minus the newline.
    name = gets.chomp
    puts "What is your contact's email?"
    email = gets.chomp
    id = @contacts.length.to_i

    # Instantiate new Contact object, passing it name and email to the initialize method.
    contact = Contact.new(name, email, id)

    # Call the push method on the @contacts array, giving the contact object as a parameter. This adds the contact to
    # end of the @contacts array.
    @contacts.push(contact)

    # Calls the run method (so that we display the main menu again)
    run
  end


  
  def list_contacts
    # Call the each method on @contacts, and pass it a block (the code between do and end).
    #   The block will be called for every entry in the contacts array.  When called, the block
    #   will be passed the current contact.
    @contacts.each do |contact|
      # call the .to_s method on contact, and then call puts with the result of the first calculation.
      # puts @contacts[id]
      puts contact.to_s

    end
    run
  end
     
  def show_id
    puts "What is your contact's id number?"
    id = gets.chomp.to_i
      if id <= @contacts.length
        # If attr_accessor :first_name was not declared in the Contact class, we wouldn't be able to use it here.
        puts @contacts[id].first_name
      else
        puts "That contact is not found."
      end
    run
  end


  def quit
    puts "Bye!"
    exit
  end
  
  # Prints the main menu 
  def show_main_menu
    puts "Welcome to the app. What's next?"
    puts " new      - Create a new contact"
    puts " list     - List all contacts"
    puts " show     - Display contact details"
    puts " quit     - Quits this program"
    print "> "
  end
 
end # class Application