require 'rubygems'
require 'sinatra'
require 'erb'

Rednames = []
Redpowers = []
Bluenames = []
Bluepowers = []

get '/' do
  erb :index
end

get '/redarray' do
  Rednames << params["redteamnames"]
  Redpowers << params["redteampowers"].to_i
  erb :index
end

get '/bluearray' do
  Bluenames << params["blueteamnames"]
  Bluepowers << params["blueteampowers"].to_i
  erb :index
end

get '/array' do
  erb :array
end

get '/tally' do
  @x = Redpowers.reduce(:+)
  @y = Bluepowers.reduce(:+)
  case
    when @x < @y
      @winner = "BLUE WINS"
    when @y < @x
      @winner = "RED WINS"
    else
      @winner = "TIE GAME"
    end
  erb :tally
end