# frozen_string_literal: true

require 'sinatra'

set :public_folder, 'public'

get "/" do
  redirect '/index.html'
end
