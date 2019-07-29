require 'gossip'

class ApplicationController < Sinatra::Base
  attr_accessor :id

# Index Page
  get '/' do
    erb :index

  end

# Create a new gossip page
  get '/gossips/new/' do
    erb :new_gossip
  end

  get '/gossips/:id/' do
    @id = params[:id]
    erb :gossip_page
  end

  post '/gossips/new' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    puts "Le gossip est enregistré dans la DB"
    redirect "/gossips/#{id}/"
  end


end