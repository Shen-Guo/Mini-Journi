     
require 'sinatra'
# require 'sinatra/reloader'
require 'pry'
require_relative 'db_config'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require_relative 'models/user'
require_relative 'models/journey'
require_relative 'models/place'
require_relative 'models/image'
require_relative 'models/meal'
require 'httparty'
require 'uri'
enable :sessions 



helpers do
  def current_user
    User.find_by(id:session[:user_id])
  end

  def current_journey
    
  end

  def sign_in?
    #!! current user  !! convert it to boolean
    if current_user
      return true
    else
      return false
    end
  end

end
after do
  ActiveRecord::Base.connection.close
end

get '/' do
  erb :index
end


get '/new_journey' do
  erb :new_journey #create title
end

post '/journeys/new' do
  @journey = Journey.new
  date = DateTime.now
  date.strftime("%d/%m/%Y %H:%M")
  @journey.date = date
  @journey.user_id = current_user.id
  @journey.title = params[:title]
  @journey.save
  
  erb :new # to add differnt places and food
  
end

get '/journeys' do
 "display all journeys"
 @journeys = Journey.where(user_id: current_user.id)
 erb :journeys
end



get '/journeys/:journey_id' do
  @journey_id = params[:journey_id]
  @places = Place.where(journey_id: @journey_id)
  @journey = Journey.find_by(id: @journey_id)
  erb :places
end



post '/journeys/:journey_id' do
 
  @journey_id= params[:journey_id]
  place = Place.new
  place.description = params[:description]
  place.image_url = params[:image_url]
  place.journey_id= @journey_id
  place.image = params[:image]
  place.location = params[:location]

  location = URI.escape(params[:location])
  result = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=AIzaSyANtLu9KmXGf5z0QgIat959tt-7agUDm4g")
  position = result["results"].first["geometry"]["location"] 
  # hash contain lat and lon
  place.lat = position['lat']
  place.lng = position['lng']
  place.save
  @place_id = place.id
  redirect "/journeys/#{@journey_id}"
end


delete '/place/:place_id' do
  
  @place_id= params[:place_id]
  place = Place.find_by(id: @place_id)
  @journey_id = place.journey_id

  place.delete

  redirect "/journeys/#{@journey_id}"
end

get '/journeys/:journey_id/meals/new' do # for the next button
  @journey_id = params[:journey_id]
  # @meals = Meal.where(journey_id: @journey_id)
  @journey = Journey.find_by(id:@journey_id)

  erb :add_meal
end


get '/journeys/:journey_id/meal' do # for the add button
  @journey_id = params[:journey_id]
  # @meals = Meal.where(journey_id: @journey_id)
  @journey = Journey.find_by(id:@journey_id)
  @meals = Meal.where(journey_id: @journey_id)
  
  erb :meals
end






post '/journeys/:journey_id/meal' do
 
  @journey_id= params[:journey_id]
  meal = Meal.new
  meal.description = params[:description]
  meal.image_url = params[:image_url]
  meal.journey_id= @journey_id
  meal.image = params[:image]
  meal.save
  @meal_id = meal.id
  redirect "/journeys/#{@journey_id}/meal"
end


delete '/meal/:meal_id' do
  
  @meal_id= params[:meal_id]
  meal = Meal.find_by(id: @meal_id)
  @journey_id = meal.journey_id

  meal.delete

  redirect "/journeys/#{@journey_id}/meal "
end





get '/create_journey_blog/:journey_id' do
  journey_id = params[:journey_id]
  @journey = Journey.find_by(id:journey_id)
  @places = Place.find_by(journey_id:journey_id)

  erb :blog
end




get '/signin' do
 
  erb :signin
end

post '/session/new' do
  if User.find_by(email:params[:email]) == nil
    @message = "you have not got an acoount with us, create one now!"
    user = User.new
    user.email = params[:email] 
    user.password = params[:password]
    user.save
    session[:user_id] = user.id
    redirect "/"  
  else
    @error = "You already have an account with us, just sign in"
    erb :signin
  end
end

post '/session' do
  user = User.find_by(email:params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/"
  else
    erb :signin
  end

end


delete '/session' do
 
  session[:user_id] = nil
  redirect "/"
end



