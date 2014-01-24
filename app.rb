require "sinatra"
require "sinatra/activerecord"
require_relative "contact"
require_relative "database"
require_relative "application"

set :database, "sqlite3:///db.sqlite"

  get "/" do
    @contacts = Contact.order("id ASC")
    erb :"contacts/index"
  end