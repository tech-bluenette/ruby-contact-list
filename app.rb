require "sinatra"
require "sinatra/activerecord"
require_relative "contact"
require_relative "database"
require_relative "application"

set :database, "sqlite3:///db.sqlite"

  get "/" do
    @contacts = Contact.order("id ASC")
    erb :"/contacts/index"
  end

  get "/contacts/new" do
    @contact = Contact.new
    erb :"/contacts/new"
  end

  post "/contacts/new" do
    @contact = Contact.new(params[:contact])
    if @contact.save
      redirect "/contacts/#{@contacts.id}"
    else
      erb :"/contacts/new"
    end
  end

  get "/contacts/:id" do
    @contact = Contact.find(params[:id])
    erb :"/contacts/show"
  end