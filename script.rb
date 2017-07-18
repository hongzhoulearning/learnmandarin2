require 'sinatra'
require 'pony'
require 'sendgrid-ruby'
require 'sinatra/base'

class Application < Sinatra::Base
  configure do
  
    Pony.options = {
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :domain => ENV['SENDGRID_DOMAIN'],
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true
      }
    }
  end

 
end



get '/' do
    erb :index
end

get '/information' do
	erb :information
end 

post '/' do
    @mail = 1
    Pony.mail(
      from: params[:name] + "<" + params[:email] + ">",
      to: 'lucashongzhou@gmail.com',
      subject: "Application from " + params[:name],
      body: "Name: " + params[:name] + "Nationality: " + params[:nationality] + "Sex: " + params[:sex] + "Date of Birth: " + params[:date] + "Educational Level: " + params[:education] + "English level: " + params[:english] + "Email: " + params[:email] + "Telephone: " + params[:telephone]
      )
    erb :index 
end