require_relative 'database'
require_relative 'contact'
require_relative 'application'

require 'rubygems'
require 'pry'

# # Instantiate a new Application object and assign it to the app variable. This will call Application's
# initialize method.
app = Application.new

# Call the run method on the app variable.
app.run



