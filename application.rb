
class Application
 
  def run

    show_main_menu
    input = gets.chomp

    case input

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
    full_name = gets.chomp.split(" ")
    puts "What is your contact's email?"
    email = gets.chomp

    Contact.create(first_name: full_name[0], last_name: full_name[1], email: email)
    run
  end


  
  def list_contacts

    Contact.all.each do |contact|
      puts contact.to_s

    end
    run
  end
     

  def show_id
    puts "What is your contact's id number?"
    id = gets.chomp.to_i
    puts Contact.find(id).to_s
    run
  end

# create a variable for contact.find.id instead of above
  def quit
    puts "Bye!"
    exit
  end
  
  def show_main_menu
    puts "Welcome to the app. What's next?"
    puts " new      - Create a new contact"
    puts " list     - List all contacts"
    puts " show     - Display contact details"
    puts " quit     - Quits this program"
    print "> "
  end
 
end 