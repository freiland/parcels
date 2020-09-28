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
  @parcels = Parcel.find(params[:id].to_i())
  erb(:parcels)
end

post('/parcels') do
  name = params[:parcel_name]
  height = params[:parcel_height].to_i()
  width = params[:parcel_width].to_i()
  length = params[:parcel_length].to_i()
  weight = params[:parcel_weight].to_i()
  parcel = Parcel.new(name,height,width,length,weight, nil)
  parcel.save()
  @parcels = Parcel.all() 
  erb(:parcels)
end

get('/parcels/:id/edit') do
  @parcels = Parcel.find(params[:id].to_i())
  erb(:edit_parcel)
end


patch('/parcels/:id') do
  @parcels = Parcel.find(params[:id].to_i())
  @parcels.update(params[:name, :height, :width, :length, :weight])
  @parcels = Parcel.all
  erb(:parcels)
end
