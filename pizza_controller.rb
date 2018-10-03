require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza_order' )
also_reload( './models/*' )

#index
get('/pizza-orders') do
  @pizzas = PizzaOrder.all()
  erb(:index)
end

#new
get('/pizza-orders/new') do
  erb(:new)
end

#show
get('/pizza-orders/:id') do
  id = params[:id].to_i()
  @pizza = PizzaOrder.find(id)
  erb(:show)
end

#create
post('/pizza-orders') do
  @pizza = PizzaOrder.new(params)
  @pizza.save()
  erb(:create)
end

#delete
post('/pizza-orders/:id/delete') do
  id = params[:id].to_i
  PizzaOrder.find(id).delete
  erb(:destroy)
end

#edit
get('/pizza-orders/:id/edit') do
  id = params[:id].to_i
  @pizza = PizzaOrder.find(id)
  erb(:edit)
end

post('/pizza-orders/:id') do
  @pizza = PizzaOrder.find(id).save
  erb(:update)
end
