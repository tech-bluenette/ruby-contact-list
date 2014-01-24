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

  get "/auth" do
    erb :"/auth"
  end

 post '/auth' do  
  "Email inputted!"  
end  
