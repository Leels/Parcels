require('sinatra')
require('sinatra/reloader')
require('./lib/parcel')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @parcels = Parcel.all
  erb(:parcels)
end

get('/parcels') do
  @parcels = Parcel.all
  erb(:parcels)
end

get('/parcels/new') do
  erb(:new_parcel)
end

get('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  erb(:parcel)
end

post('/parcels') do
  length = params[:length].to_i
  width = params[:width].to_i
  height = params[:height].to_i
  weight = params[:weight].to_i
  destination = params[:destination]
  parcel = Parcel.new(length, width, height, weight, destination, nil)
  parcel.save()
  @parcels = Parcel.all() # Adding this line will fix the error.
  erb(:parcels)
end

get('/parcels/:id/edit') do
  @parcel = Parcel.find(params[:id].to_i())
  erb(:update_parcel)
end

patch('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  @parcel.update(params[:length].to_i, params[:width].to_i, params[:height].to_i, params[:weight].to_i)
  @parcels = Parcel.all
  erb(:parcels)
end

delete('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  @parcel.delete()
  @parcels = Parcel.all
  erb(:parcels)
end
