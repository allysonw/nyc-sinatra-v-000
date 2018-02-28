class LandmarksController < ApplicationController

# ----- INDEX -----

get '/landmarks' do
  erb :'/landmarks/index'
end

# ----- CREATE -----

get '/landmarks/new' do
  erb :'/landmarks/new'
end

post '/landmarks' do
  @landmark = Landmark.find_or_create_by(name: params[:landmark][:name])

  @landmark.year_completed = params[:landmark][:year_completed]

  @landmark.save
  redirect to "landmarks/#{@landmark.id}"
end

# ----- READ -----

get '/landmarks/:id' do
  @landmark = Landmark.find(params[:id])
  erb :'/landmarks/show'
end

# ----- UPDATE -----
get '/landmarks/:id/edit' do
  @landmark = Landmark.find(params[:id])
  erb :'/landmarks/edit'
end

patch '/landmarks/:id' do
  @landmark = Landmark.find(params[:id])

  @landmark.name = params[:landmark][:name]
  @landmark.year_completed = params[:landmark][:year_completed]

  @landmark.save
  redirect to "landmarks/#{@landmark.id}"
end

end
