require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/teams' do
        @team_name = params[:team][:name]
        @team_motto = params[:team][:motto]
        @names = []
        @powers = []
        @bios = []
        @heroes = params[:team][:members]
        @heroes.each do |h|
          @names << h[:name]
          @powers << h[:power]
          @bios << h[:bio]
        end
        erb :team
    end

end
