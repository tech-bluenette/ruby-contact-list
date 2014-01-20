require_relative 'contact'
require_relative 'application'
 
Application.new.run

answer = " "
if answer == "quit"
  abort("Goodbye!")
end

