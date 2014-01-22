
# Defining/declaring a new class called Contact.
class Contact

  # attr_accessor makes these attributes available outside of this class.
  # : is before these attributes because otherwise Ruby would try to execute them as methods
  # instead of passing them as arguments to attr_accessor.
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :email
  attr_accessor :id
  
  # The method that is run when a class is being instantiated is called a constructor. In Ruby, the constructor
  # is always named initialize. This is a constructor method.

  def initialize(name, email, id)
   
   # This code is run when Contact is instantiated. 
    # Split seperates a string into an array, where each element of the array is a portion of the string that
    # comes before the character passed to split. ex:
    # # `"bork pants monkey".split(" ") => ['bork', 'pants', 'monkey']
    # The below gives guidelines on how the new contact is built, using the info inputted from the user
    # (in this name and email)
    @first_name = name.split(" ").first
    @last_name = name.split(" ").last
    # Set the instance variable (existing only within an instance of a class) email 
    # to the value of the local variable email (only within this method.)
    @email = email
    @id = id
  end
  
  def to_s
    # returns the string.
    "#{@first_name.to_s} #{@last_name.to_s} #{@email.to_s}"
  end
  
end

# Trying to save the index of each variable in contacts array in class variable (@@contact_id)
# Then when user inputs show, I want to be able to take in the id number (index number) and show
# the correct contact.
