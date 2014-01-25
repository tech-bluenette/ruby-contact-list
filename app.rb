require "sinatra"
require "sinatra/activerecord"
require "sinatra/cookies"

require_relative "contact"
require_relative "database"
require_relative "application"

set :database, "sqlite3:///db.sqlite"

  get '/' do
    erb :"/auth"
  end

  post "/auth" do        
    response.set_cookie("owner_email", :value => params[:owner_email], :path => "/")
    redirect "/contacts/index"
  end


  get "/contacts/index" do
    @contacts = Contact.where(owner_email: cookies[:owner_email]).order("id ASC")
    erb :"/contacts/index"
  end

  get "/contacts/new" do
    @contact = Contact.new
    erb :"/contacts/new"
  end

  post "/contacts/new" do
    @contact = Contact.new(params[:contact])
    @contact.owner_email = cookies[:owner_email]
    if @contact.save
      redirect "/contacts/#{@contact.id}"
    else
      erb :"/contacts/new"
    end
  end

  get "/contacts/:id" do
    @contact = Contact.find(params[:id])
    erb :"/contacts/show"
  end

  get "/contacts/:id/edit" do
    @contact = Contact.find(params[:id])
    erb :"/contacts/edit"
  end

  put "/contacts/:id" do
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      redirect "/contacts/#{@contact.id}"
    else
      erb :"contacts/edit"
    end
  end

  helpers do
    def delete_button(id)
      erb :_delete_button, locals: { contact_id: id}
    end
  end

  delete "/contacts/:id" do
    @contact = Contact.find(params[:id]).destroy
    redirect "/"
  end


