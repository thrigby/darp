require 'rubygems'
require 'sinatra'
require 'erb'

Rednames = []
Redpowers = []
Bluenames = []
Bluepowers = []

class Array
  def inject(n)
     each { |value| n = yield(n, value) }
     n
  end
  def sum
    inject(0) { |n, value| n + value }
  end
end

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

get '/tally' do
  @x = Redpowers.sum
  @y = Bluepowers.sum
  case 
    when @x > @y
    @winner = "RED WINS"
    when @y < @x
    @winner = "BLUE WINS"
    else
    @winner = "TIE GAME"
    end
      
  erb :tally
end