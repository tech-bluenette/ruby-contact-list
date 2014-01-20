class Application
 
  def initialize
    # Start with an empty array of contacts.
    # TODO: Perhaps stub (seed) some contacts so we don't have to create some every time we restart the app
    @contacts = []
  end
 
  def run
    show_main_menu
    input = gets.chomp
      if input == "reprint"
        show_main_menu
      end

      if input == "quit"
          abort("Goodbye!")
      end
  end
  
  # Prints the main menu only
  def show_main_menu
    puts "Welcome to the app. What's next?"
    puts " new      - Create a new contact"
    puts " list     - List all contacts"
    puts " show :id - Display contact details"
    puts " reprint  - Reprints main menu"
    puts " quit     - Quits this program"
    print "> "
  end
 
end